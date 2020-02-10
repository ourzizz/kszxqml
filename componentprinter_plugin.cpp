#include "componentprinter_plugin.h"
#include "printer.h"

#include <qqml.h>

void ComponentPrinterPlugin::registerTypes(const char *uri)
{
    // @uri com.foxmoxie.Printer
    //Q_ASSERT(uri == QLatin1String("com.foxmoxie.Printer"));

    qmlRegisterType<Printer>(uri, 1, 0, "Printer");
}


