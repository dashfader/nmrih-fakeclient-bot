#include <sourcemod>
#include <sdktools>

ArrayList g_BotList;

public void OnPluginStart() {
    RegAdminCmd("sm_spawnbot", SpawnBot, ADMFLAG_GENERIC);
    g_BotList = new ArrayList();
}

public void OnPluginEnd() {
    delete g_BotList;
}

public Action:SpawnBot(client, args) {
    int botclient = CreateFakeClient("Survivor Bot");
    DispatchSpawn(botclient);
    g_BotList.Push(botclient);

    if (client > 0 && IsClientInGame(client)) {
        PrintToChat(client, "A bot has been spawned! Total bots: %i", g_BotList.Length);
    } else {
        PrintToServer("A bot has been spawned! Total bots: %i", g_BotList.Length);
    }
    return Plugin_Handled;
}