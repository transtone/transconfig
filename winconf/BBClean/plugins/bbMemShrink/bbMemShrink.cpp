/*---------------------------------------------------------------------------------
 bbMemShrink (© 2004 Slade Taylor [bladestaylor@yahoo.com])
 ----------------------------------------------------------------------------------
 bbMemShrink is a plugin for Blackbox for Windows.  For more information,
 please visit [http://bb4win.org] or [http://sourceforge.net/projects/bb4win].
 ----------------------------------------------------------------------------------
 bbMemShrink is free software, released under the GNU General Public License,
 version 2, as published by the Free Software Foundation.  It is distributed
 WITHOUT ANY WARRANTY--without even the implied warranty of MERCHANTABILITY
 or FITNESS FOR A PARTICULAR PURPOSE.  Please see the GNU General Public
 License for more details:  [http://www.fsf.org/licenses/gpl.html].
 --------------------------------------------------------------------------------*/

#ifndef _WIN32_WINNT
    #define _WIN32_WINNT 0x0500
#endif

#define VC_EXTRALEAN

#include "../bbLean/BBApi.h"

//---------------------------------------------------------------------------------

enum PLUGIN_INFO { NAME_VERSION = 0, APPNAME, VERSION, AUTHOR, RELEASEDATE, WEBLINK, EMAIL };

extern "C"
{
    __declspec(dllexport) void      endPlugin(HINSTANCE);
    __declspec(dllexport) int       beginPlugin(HINSTANCE);

    __declspec(dllexport) LPCSTR    pluginInfo(int x)
    {
        switch (x)
        {
            case APPNAME:       return "bbMemShrink";
            case VERSION:       return "0.0.1";
            case AUTHOR:        return "bladestaylor";
            case RELEASEDATE:   return "March 31, 2004";
            case WEBLINK:       return "http://bb4win.sourceforge.net/bladestaylor/";
            case EMAIL:         return "bladestaylor@yahoo.com";
            default:            return "bbMemShrink 0.0.1";
        }
    };
}

//---------------------------------------------------------------------------------

static HANDLE   hProcess = NULL;
static HWND     hPluginWnd = NULL;
static int      bb_messages[] = {BB_BROADCAST, 0};

//---------------------------------------------------------------------------------

LRESULT CALLBACK PluginProc(HWND hwnd, UINT message, WPARAM wParam, LPARAM lParam)
{
    if (message == BB_BROADCAST)
    {
        if (!_stricmp("@ShrinkMemory", (char*)(lParam)))
            SetProcessWorkingSetSize(hProcess, (SIZE_T)-1, (SIZE_T)-1);
        return 0;
    }
    return DefWindowProc(hwnd, message, wParam, lParam);
}

//---------------------------------------------------------------------------------

int beginPlugin(HINSTANCE h_instance)
{
    WNDCLASS wc;
    ZeroMemory(&wc, sizeof(wc));
    wc.lpfnWndProc = PluginProc;
    wc.hInstance = h_instance;
    wc.lpszClassName = pluginInfo(APPNAME);
    RegisterClass(&wc);

    hPluginWnd = CreateWindowEx(
        WS_EX_TOOLWINDOW,
        pluginInfo(APPNAME),
        NULL,
        WS_POPUP|WS_ICONIC,
        -4, -4, 0, 0,
        HWND_MESSAGE,
        NULL,
        h_instance,
        NULL
    );

    hProcess = GetCurrentProcess();
    SendMessage(GetBBWnd(), BB_REGISTERMESSAGE, (WPARAM)hPluginWnd, (LPARAM)bb_messages);
    return 0;
}

//---------------------------------------------------------------------------------

void endPlugin(HINSTANCE h_instance)
{
    DestroyWindow(hPluginWnd);
    SendMessage(GetBBWnd(), BB_UNREGISTERMESSAGE, (WPARAM)hPluginWnd, (LPARAM)bb_messages);
    UnregisterClass(pluginInfo(APPNAME), h_instance);
}

//---------------------------------------------------------------------------------
