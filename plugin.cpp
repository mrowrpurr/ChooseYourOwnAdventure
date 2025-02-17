#include <RE/Skyrim.h>
#include <SKSE/SKSE.h>
#include <SksePluginDefinition.h>

extern "C" __declspec(dllexport) bool SKSEPlugin_Query(
    const SKSE ::QueryInterface* a_skse, SKSE ::PluginInfo* a_info
) {
    REL::Version version{0, 0, 1};
    a_info->infoVersion = SKSE ::PluginInfo ::kVersion;
    a_info->name        = "Quest Weaver";
    a_info->version     = version.pack();
    if (a_skse->IsEditor()) return false;
    return true;
}

extern "C" __declspec(dllexport) constinit auto SKSEPlugin_Version = []() {
    SKSE ::PluginVersionData v{};
    v.PluginName("Quest Weaver");
    v.AuthorName("Mrowr Purr");
    v.AuthorEmail("mrowr.purr@gmail.com");
    v.PluginVersion(REL ::Version(0, 0, 1));
    v.UsesAddressLibrary();
    v.UsesUpdatedStructs();
    return v;
}();

SKSE_PLUGIN_ENTRY_POINT(const SKSE::LoadInterface* a_skse) {
    SKSE::Init(a_skse);

    SKSE::GetMessagingInterface()->RegisterListener(
        "SKSE",
        [](SKSE::MessagingInterface::Message* a_msg) {
            if (a_msg->type == SKSE::MessagingInterface::kDataLoaded)
                RE::ConsoleLog::GetSingleton()->Print("Quest Weaver initialized.");
        }
    );

    return true;
}
