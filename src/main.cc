#include <print>

#include <blook/blook.h>

#include "Windows.h"
#include "blook/misc.h"

void open_console() {
    AllocConsole();
    freopen("CONOUT$", "w", stdout);
}

void entry() {
    open_console();
    blook::misc::install_optimize_dll_hijacking("HID.dll");
    std::println("Hello from example-project!");
}

BOOL WINAPI DllMain(HINSTANCE hinstDLL, DWORD fdwReason, LPVOID lpvReserved) {
    switch (fdwReason) {
        case DLL_PROCESS_ATTACH:
            DisableThreadLibraryCalls(hinstDLL);
            entry();
            break;
    }
    return TRUE;
}