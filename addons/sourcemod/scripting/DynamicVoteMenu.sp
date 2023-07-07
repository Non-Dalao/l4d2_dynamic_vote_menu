#include <sourcemod>
#include <neko/nekotools>
#include <neko/nekonative>
#include <builtinvotes>
#include <colors>
#include <string>

#define VoteMax 9

public char VoteName[64],
            VoteStatus[64];

public void OnPluginStart()
{
    RegConsoleCmd("sm_dmenu",RenderVoteMenu,"(测试)渲染菜单");
}

void GetVoteName(int type)      //获取菜单上显示的参数对应的名称,并存入VoteName
{
    switch(type)
    {
        case 1:
            strcopy(VoteName,sizeof(VoteName),"刷特模式");
        case 2:
            strcopy(VoteName,sizeof(VoteName),"刷特时间");
        case 3:
            strcopy(VoteName,sizeof(VoteName),"游戏模式");
        case 4:
            strcopy(VoteName,sizeof(VoteName),"游戏难度");
        case 5:
            strcopy(VoteName,sizeof(VoteName),"无包模式");
        case 6:
            strcopy(VoteName,sizeof(VoteName),"多特开关");
        case 7:
            strcopy(VoteName,sizeof(VoteName),"克血模式");
        case 8:
            strcopy(VoteName,sizeof(VoteName),"商店开关");
        case 9:
            strcopy(VoteName,sizeof(VoteName),"内鬼模式");
    }
    return;
}

void GetVoteStatus(int type, int status)//获取参数对应的值在菜单面板上的显示，并存入VoteName
{
    switch(type)
    {
        case 1:                         //刷特模式
            {
                switch(status)
                {
                    case 1:
                        strcopy(VoteStatus,sizeof(VoteStatus),"N人N特");
                    case 2:
                        strcopy(VoteStatus,sizeof(VoteStatus),"固定四特");
                }
            }
        case 2:                         //刷特时间
            IntToString(status,VoteStatus,sizeof(VoteStatus));
        case 3:                         //游戏模式
            {
                switch(status)
                {
                    case 1:
                        strcopy(VoteStatus,sizeof(VoteStatus),"战役模式");
                    case 2:
                        strcopy(VoteStatus,sizeof(VoteStatus),"写实模式");
                    case 3:
                        strcopy(VoteStatus,sizeof(VoteStatus),"特感速递");
                    case 4:
                        strcopy(VoteStatus,sizeof(VoteStatus),"坦 克 润");
                    case 5:
                        strcopy(VoteStatus,sizeof(VoteStatus),"猎人银趴");
                    case 6:
                        strcopy(VoteStatus,sizeof(VoteStatus),"绝境求生");   
                }
            }    
        case 4:                         //游戏难度
            {    
                switch(status)
                {
                    case 1:
                        strcopy(VoteStatus,sizeof(VoteStatus),"简单");
                    case 2:
                        strcopy(VoteStatus,sizeof(VoteStatus),"普通");
                    case 3:
                        strcopy(VoteStatus,sizeof(VoteStatus),"困难");
                    case 4:
                        strcopy(VoteStatus,sizeof(VoteStatus),"专家");   
                }
            }    
        case 5:                         //无包模式
            {
                switch(status)
                {
                    case 1:
                        strcopy(VoteStatus,sizeof(VoteStatus),"开启");
                    case 2:
                        strcopy(VoteStatus,sizeof(VoteStatus),"关闭");
                }
            }        
        case 6:                         //多特开关
            {
                switch(status)
                {
                    case 1:
                        strcopy(VoteStatus,sizeof(VoteStatus),"开启");
                    case 2:
                        strcopy(VoteStatus,sizeof(VoteStatus),"关闭");
                }
            }
        case 7:                         //克血模式
            {
                switch(status)
                {
                    case 1:
                        strcopy(VoteStatus,sizeof(VoteStatus),"根据难度");
                    case 2:
                        strcopy(VoteStatus,sizeof(VoteStatus),"根据人数");
                }
            }
        case 8:                         //商店开关
            {
                switch(status)
                {
                    case 1:
                        strcopy(VoteStatus,sizeof(VoteStatus),"开启");
                    case 2:
                        strcopy(VoteStatus,sizeof(VoteStatus),"关闭");
                }
            }
        case 9:                         //内鬼模式
            {
                switch(status)
                {
                    case 1:
                        strcopy(VoteStatus,sizeof(VoteStatus),"开启");
                    case 2:
                        strcopy(VoteStatus,sizeof(VoteStatus),"关闭");
                }
            }
    }
    return;
}
public Action RenderVoteMenu(int client, int args)//使用title渲染菜单（title才是真菜单）
{
    char menuinfo[1024];
    char binfo[1024];
    char selection[128];
    Menu menu = new Menu(TopMenu);
    FormatEx(menuinfo,sizeof(menuinfo),"投票菜单(building):\n \n");
    for(int i=1;i<=VoteMax;i++) //逐行获取菜单选项
    {   
        GetVoteName(i);
        GetVoteStatus(i,1);
        strcopy(binfo,sizeof(binfo),menuinfo);
        FormatEx(menuinfo,sizeof(menuinfo),"%s%s        %s\n",binfo,VoteName,VoteStatus);
    }
    menu.SetTitle(menuinfo);

    FormatEx(selection,sizeof(selection),"发起投票");//目前没有什么屁用，只是占一个选项让菜单渲染起来
    menu.AddItem("StartVoting",selection);
    
    menu.Display(client,30)
    return Plugin_Continue;
}

public int TopMenu(Menu menu, MenuAction action, int param1, int param2)
{

}

void GetCurrentStatus()
{

}
