#include "htmlpage.h"
#include "mainwindow.h"
#include "QDebug"

HTMLPage::HTMLPage(MainWindow* mw, int htmlWindowIdentifier, QWidget *parent) :
    QWebEnginePage(parent), _mw(mw), _webChannel(new QWebChannel(this)), _mznide(new MiniZincIDEJS(this)), _htmlWindowIdentifier(htmlWindowIdentifier),
    loadFinished(false)
{
    connect(this, SIGNAL(loadFinished(bool)), this, SLOT(pageLoadFinished(bool)));
    setWebChannel(_webChannel);
    _webChannel->registerObject("mznide", _mznide);
}

void
HTMLPage::javaScriptConsoleMessage(JavaScriptConsoleMessageLevel, const QString &message, int lineNumber, const QString &sourceID)
{
    _mw->addOutput("<div style='color:red;'>JavaScript message: source " +sourceID + ", line no. " + QString().number(lineNumber) + ": " + message + "</div><br>\n");
}

void HTMLPage::runJs(QString js)
{
    runJavaScript(js);
}

MiniZincIDEJS::MiniZincIDEJS(HTMLPage *p)
    : QObject(p), _htmlPage(p)
{

}

void MiniZincIDEJS::selectSolution(int n)
{
    _htmlPage->selectSolution(n);
}

void MiniZincIDEJS::solve(const QString& data)
{
    _htmlPage->solve(data);
}

void
HTMLPage::selectSolution(int n)
{
    _mw->selectJSONSolution(this,n);
}

void
HTMLPage::solve(const QString& data)
{
    _mw->resolve(_htmlWindowIdentifier,data);
}

void
HTMLPage::pageLoadFinished(bool ok)
{
    if (ok) {
        loadFinished = true;

        // Load qwebchannel javascript
        QFile qwebchanneljs(":/qtwebchannel/qwebchannel.js");
        if (!qwebchanneljs.open(QIODevice::ReadOnly | QIODevice::Text)) {
            qDebug() << "can't open qrc:///qtwebchannel/qwebchannel.js";
            return;
        }
        QTextStream qwebchanneljs_in(&qwebchanneljs);
        QString qwebchanneljs_text = qwebchanneljs_in.readAll();
        runJs(qwebchanneljs_text);

        QString setup_object("new QWebChannel(qt.webChannelTransport, function (channel) {"
                             "window.mznide = channel.objects.mznide;"
                             "});"
                             );
        runJs(setup_object);

        for (int i=0; i<json.size(); i++) {
            runJs(json[i]);
        }
        json.clear();
    }
}

void
HTMLPage::addSolution(const QString &json0)
{
    QString j = json0;
    j.replace("'","\\'");
    j.replace("\"","\\\"");
    j.replace("\n"," ");
    if (loadFinished) {
        runJs("addSolution('"+j+"')");
    } else {
        json.push_back("addSolution('"+j+"')");
    }
}

void
HTMLPage::initJSON(const QString &json0)
{
    QString j = json0;
    j.replace("'","\\'");
    j.replace("\"","\\\"");
    j.replace("\n"," ");
    if (loadFinished) {
        runJs("initJSON('"+j+"')");
    } else {
        json.push_back("initJSON('"+j+"')");
    }
}

void
HTMLPage::finish(qint64 runtime)
{
    QString jscall = "if (typeof finish == 'function') { finish("+QString().number(runtime)+"); }";
    if (loadFinished) {
        runJs(jscall);
    } else {
        json.push_back(jscall);
    }
}

void
HTMLPage::showSolution(int n)
{
    if (loadFinished) {
        runJs("gotoSolution('"+QString().number(n)+"')");
    }
}
