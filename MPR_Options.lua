MPR_Options = CreateFrame("Frame", "MPR Options", UIParent);

local framecount = 0
function GetNewID() 
    framecount = framecount + 1
    return framecount
end
function GetCurrentID()
    return framecount
end

function MPR_Options:Initialize()
    MPR_Options:Hide()
    MPR_Options.name = "MPR_Options"
    
    MPR_Options:SetBackdrop(MPR.Settings["BACKDROP"])
    MPR_Options:SetBackdropColor(unpack(MPR.Settings["BACKDROPCOLOR"]))
    MPR_Options:SetBackdropBorderColor(MPR.Settings["BACKDROPBORDERCOLOR"].R/255, MPR.Settings["BACKDROPBORDERCOLOR"].G/255, MPR.Settings["BACKDROPBORDERCOLOR"].B/255)
    
    MPR_Options:SetPoint("CENTER",UIParent)
    MPR_Options:SetWidth(416)
    MPR_Options:SetHeight(308)
    MPR_Options:EnableMouse(true)
    MPR_Options:SetMovable(true)
    MPR_Options:RegisterForDrag("LeftButton")
    MPR_Options:SetUserPlaced(true)
    MPR_Options:SetScript("OnDragStart", function(self) self:StartMoving() end)
    MPR_Options:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    MPR_Options:SetFrameStrata("FULLSCREEN_DIALOG")
    
    --[[ MP Reporter - Options ]]--
    MPR_Options.Title = MPR_Options:CreateFontString("Title"..GetNewID(), "ARTWORK", "GameFontNormal")
    MPR_Options.Title:SetPoint("TOP", 0, -12)
    if type(Color) ~= "string" then Color = "FFFFFF" end
    MPR_Options.Title:SetTextColor(tonumber(Color:sub(1,2),16)/255, tonumber(Color:sub(3,4),16)/255, tonumber(Color:sub(5,6),16)/255) 
    MPR_Options.Title:SetText("|cFF"..MPR.Colors["TITLE"].."MP Reporter|r ("..MPR.Version..") - Options")
    MPR_Options.Title:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    MPR_Options.Title:SetShadowOffset(1, -1)
    
    MPR_Options_BtnClose = CreateFrame("button","MPR_Options_BtnClose", MPR_Options, "UIPanelButtonTemplate")
    MPR_Options_BtnClose:SetHeight(14)
    MPR_Options_BtnClose:SetWidth(14)
    MPR_Options_BtnClose:SetPoint("TOPRIGHT", -12, -11)
    MPR_Options_BtnClose:SetText("x")
    MPR_Options_BtnClose:SetScript("OnClick", function(self) MPR_Options:Hide() end)
    
    --[[ General ]]--
    MPR_Options:NewFS("General","00CCFF",16,-30)
    MPR_Options:NewCB("Se",    "1E90FF",    "SELF",14,-41)        -- [ ] Self
    MPR_Options:NewCB("R",    "EE7600",    "RAID",44,-41)        -- [ ] Raid
    MPR_Options:NewCB("Sa",    "FFFFFF",    "SAY",72,-41)        -- [ ] Say
    MPR_Options:NewCB("W","DA70D6",    "WHISPER",102,-41)    -- [ ] Whisper
	MPR_Options:NewCB("C","CCCCCC",    "CABEZAZOS",132,-41)    -- [ ] Cabezazos
    
    -- Report:
    MPR_Options:NewFS("Reporting:","20B2AA",16,-60)
    MPR_Options:NewCB("Dispels",nil,"REPORT_DISPELS",14,-71)            -- [ ] Dispels
    MPR_Options:NewCB("Mass Dispels",nil,"REPORT_MASSDISPELS",89,-71)    -- [ ] Mass Dispels
    
    -- Report in:
    MPR_Options:NewFS("Reporting in:","3CB371",16,-90)
    MPR_Options:NewCB("Dungeon",nil,"REPORTIN_PARTY",14,-101)
    MPR_Options:NewCB("Raid Instance",nil,"REPORTIN_RAIDINSTANCE",85,-101)
    MPR_Options:NewCB("Battleground",nil,"REPORTIN_BATTLEGROUND",14,-115)
    MPR_Options:NewCB("Arena",nil,"REPORTIN_ARENA",100,-115)
    MPR_Options:NewCB("outside",nil,"REPORTIN_OUTSIDE",152,-115)
    
    -- Player Deaths
    MPR_Options:NewFS("Player Deaths","22FF00",16,-133)
    MPR_Options:NewCB("Enable",  "FFFFFF",    "PD_REPORT",104,-129)     -- [ ] Enable reporting
    MPR_Options:NewCB("Se",    "1E90FF",    "PD_SELF",14,-144)       -- [ ] Self
    MPR_Options:NewCB("R",    "EE7600",    "PD_RAID",44,-144)       -- [ ] Raid
    MPR_Options:NewCB("G",   "40FF40",    "PD_GUILD",72,-144)     -- [ ] Guild
    MPR_Options:NewCB("W", "DA70D6",    "PD_WHISPER",102,-144)   -- [ ] Whisper
	MPR_Options:NewCB("C",   "CCCCCC",    "PD_CABEZAZOS",132,-144)     -- [ ] Cabezazos
    
    -- Report deaths ...
    MPR_Options:NewFS("Report deaths","FFAA00",16,-163)
    
    -- Report!
    MPR_Options.BTN_REPORT = CreateFrame("button","BtnReport", MPR_Options, "UIPanelButtonTemplate")
    MPR_Options.BTN_REPORT:SetHeight(18)
    MPR_Options.BTN_REPORT:SetWidth(58)
    MPR_Options.BTN_REPORT:SetPoint("TOPLEFT", 150, -199)
    MPR_Options.BTN_REPORT:SetText("Report!")
    MPR_Options.BTN_REPORT:SetScript("OnClick", function(self)
        if MPR.Settings["DEATHREPORT_CHANNEL"] and tonumber(MPR_Options.FS_ID:GetText()) then
            MPR:DeathReport(MPR.Settings["DEATHREPORT_CHANNEL"], tonumber(MPR_Options.FS_ID:GetText()))
        end
    end)
    
    MPR_Options.FS_ID = MPR_Options:CreateFontString("FS_ID", "ARTWORK", "GameFontNormal")
    MPR_Options.FS_ID:SetPoint("TOPLEFT", 102, -163)
    MPR_Options.FS_ID:SetTextColor(1,1,1) 
    MPR_Options.FS_ID:SetText(#MPR.DataDeaths)
    MPR_Options.FS_ID:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    
    MPR_Options:SetScript("OnShow", function(self) 
        MPR_Options.FS_ID:SetText(#MPR.DataDeaths)
        local Data = MPR.DataDeaths[tonumber(MPR_Options.FS_ID:GetText())]
        MPR_Options.FS_ID_NAME:SetText(Data and "|cFF"..(Data.Color or "FFFFFF")..Data.Name.."|r|cFFBEBEBE: "..#Data.Deaths.." deaths,|r" or "")
        MPR_Options.FS_ID_TIME:SetText(MPR.DataDeaths[tonumber(MPR_Options.FS_ID:GetText())] and (MPR.DataDeaths[tonumber(MPR_Options.FS_ID:GetText())].GameTimeStart or "unknown").." - "..(MPR.DataDeaths[tonumber(MPR_Options.FS_ID:GetText())].GameTimeEnd or "unknown") or "")
    end)
    
    MPR_Options.BTN_ID_LESS = CreateFrame("button","BTN_ID_LESS", MPR_Options, "UIPanelButtonTemplate")
    MPR_Options.BTN_ID_LESS:SetHeight(14)
    MPR_Options.BTN_ID_LESS:SetWidth(14)
    MPR_Options.BTN_ID_LESS:SetPoint("TOPLEFT", "FS_ID", "TOPRIGHT", 2, 0)
    MPR_Options.BTN_ID_LESS:SetText("-")
    MPR_Options.BTN_ID_LESS:SetScript("OnShow", function(self) MPR_Options:ID_HandleOnShow() end)
    MPR_Options.BTN_ID_LESS:SetScript("OnClick", function(self) MPR_Options:ID_HandleOnClick(-1) end)
    
    MPR_Options.BTN_ID_MORE = CreateFrame("button","BTN_ID_MORE", MPR_Options, "UIPanelButtonTemplate")
    MPR_Options.BTN_ID_MORE:SetHeight(14)
    MPR_Options.BTN_ID_MORE:SetWidth(14)
    MPR_Options.BTN_ID_MORE:SetPoint("TOPLEFT", "BTN_ID_LESS", "TOPRIGHT", 1, 0)
    MPR_Options.BTN_ID_MORE:SetText("+")
    MPR_Options.BTN_ID_MORE:SetScript("OnShow", function(self) MPR_Options:ID_HandleOnShow() end)
    MPR_Options.BTN_ID_MORE:SetScript("OnClick", function(self) MPR_Options:ID_HandleOnClick(1) end)
    
    MPR_Options.BTN_CLEAR_DEATHLOG = CreateFrame("button","BTN_CLEAR_DEATHLOG", MPR_Options, "UIPanelButtonTemplate")
    MPR_Options.BTN_CLEAR_DEATHLOG:SetHeight(14)
    MPR_Options.BTN_CLEAR_DEATHLOG:SetWidth(44)
    MPR_Options.BTN_CLEAR_DEATHLOG:SetPoint("TOPLEFT", "BTN_ID_MORE", "TOPRIGHT", 8, 0)
    MPR_Options.BTN_CLEAR_DEATHLOG:SetText("Reset")
    MPR_Options.BTN_CLEAR_DEATHLOG:SetScript("OnClick", function(self) MPR:ClearDeathLog() end)
    
    MPR_Options:NewCB("Enable logging","FFFFFF","PD_LOG",16,-174)   -- [ ] Enable logging
    
    MPR_Options.FS_ID_NAME = MPR_Options:CreateFontString("FS_ID_NAME", "ARTWORK", "GameFontNormal")
    MPR_Options.FS_ID_NAME:SetPoint("TOPLEFT", 16, -191)
    local Data = MPR.DataDeaths[tonumber(MPR_Options.FS_ID:GetText())]
    MPR_Options.FS_ID_NAME:SetText(Data and "|cFF"..(Data.Color or "FFFFFF")..Data.Name.."|r|cFFBEBEBE: "..#Data.Deaths.." deaths,|r" or "")
    MPR_Options.FS_ID_NAME:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
    
    MPR_Options.FS_ID_TIME = MPR_Options:CreateFontString("FS_ID_TIME", "ARTWORK", "GameFontNormal")
    MPR_Options.FS_ID_TIME:SetPoint("TOPLEFT", "FS_ID_NAME", "BOTTOMLEFT", 0, -1)
    MPR_Options.FS_ID_TIME:SetTextColor(1,1,1)
    MPR_Options.FS_ID_TIME:SetTextColor(190/255,190/255,190/255)
    MPR_Options.FS_ID_TIME:SetText(MPR.DataDeaths[tonumber(MPR_Options.FS_ID:GetText())] and (MPR.DataDeaths[tonumber(MPR_Options.FS_ID:GetText())].GameTimeStart or "unknown").." - "..(MPR.DataDeaths[tonumber(MPR_Options.FS_ID:GetText())].GameTimeEnd or "unknown") or "")
    MPR_Options.FS_ID_TIME:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
    
    -- SELF
    MPR_Options.CB_Self = CreateFrame("CheckButton", "CB_Self", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Self:SetWidth(20)
    MPR_Options.CB_Self:SetHeight(20)
    MPR_Options.CB_Self:SetPoint("TOPLEFT", 16, -213)
    _G["CB_SelfText"]:SetText("|cFF1E90FFSe|r")
    MPR_Options.CB_Self:SetScript("OnShow",  function(self) MPR_Options.CB_Self:SetChecked(MPR.Settings["DEATHREPORT_CHANNEL"] == "Self") end)
    MPR_Options.CB_Self:SetScript("OnClick", function(self) 
        MPR_Options.CB_Self:SetChecked(true); MPR_Options.CB_Raid:SetChecked(false); MPR_Options.CB_Guild:SetChecked(false); MPR_Options.CB_Cabezazos:SetChecked(false);
        MPR.Settings["DEATHREPORT_CHANNEL"] = "Self"
    end)
    -- RAID
    MPR_Options.CB_Raid = CreateFrame("CheckButton", "CB_Raid", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Raid:SetWidth(20)
    MPR_Options.CB_Raid:SetHeight(20)
    MPR_Options.CB_Raid:SetPoint("TOPLEFT", 46, -213)
    _G["CB_RaidText"]:SetText("|cFFEE7600R|r")
    MPR_Options.CB_Raid:SetScript("OnShow",  function(self) MPR_Options.CB_Raid:SetChecked(MPR.Settings["DEATHREPORT_CHANNEL"] == "Raid") end)
    MPR_Options.CB_Raid:SetScript("OnClick", function(self) 
        MPR_Options.CB_Self:SetChecked(false); MPR_Options.CB_Raid:SetChecked(true); MPR_Options.CB_Guild:SetChecked(false); MPR_Options.CB_Cabezazos:SetChecked(false);
        MPR.Settings["DEATHREPORT_CHANNEL"] = "Raid"
    end)
    -- GUILD
    MPR_Options.CB_Guild = CreateFrame("CheckButton", "CB_Guild", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Guild:SetWidth(20)
    MPR_Options.CB_Guild:SetHeight(20)
    MPR_Options.CB_Guild:SetPoint("TOPLEFT", 73, -213)
    _G["CB_GuildText"]:SetText("|cFF40FF40G|r")
    MPR_Options.CB_Guild:SetScript("OnShow",  function(self) MPR_Options.CB_Guild:SetChecked(MPR.Settings["DEATHREPORT_CHANNEL"] == "Guild") end)
    MPR_Options.CB_Guild:SetScript("OnClick", function(self) 
        MPR_Options.CB_Self:SetChecked(false); MPR_Options.CB_Raid:SetChecked(false); MPR_Options.CB_Guild:SetChecked(true); MPR_Options.CB_Cabezazos:SetChecked(false);
        MPR.Settings["DEATHREPORT_CHANNEL"] = "Guild"
    end)
    -- CABEZAZOS
    MPR_Options.CB_Cabezazos = CreateFrame("CheckButton", "CB_Cabezazos", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Cabezazos:SetWidth(20)
    MPR_Options.CB_Cabezazos:SetHeight(20)
    MPR_Options.CB_Cabezazos:SetPoint("TOPLEFT", 100, -213)
    _G["CB_CabezazosText"]:SetText("|cFFCCCCCCC|r")
    MPR_Options.CB_Cabezazos:SetScript("OnShow",  function(self) MPR_Options.CB_Cabezazos:SetChecked(MPR.Settings["DEATHREPORT_CHANNEL"] == "Cabezazos") end)
    MPR_Options.CB_Cabezazos:SetScript("OnClick", function(self) 
        MPR_Options.CB_Self:SetChecked(false); MPR_Options.CB_Raid:SetChecked(false); MPR_Options.CB_Guild:SetChecked(false); MPR_Options.CB_Cabezazos:SetChecked(true);
        MPR.Settings["DEATHREPORT_CHANNEL"] = "Cabezazos"
    end)
    
    --[[ Aura Info ]]--
    MPR_Options:NewFS("Aura Info","FF2200",16,-234)
    MPR_Options:NewCB("Enable","FFFFFF","AURAINFO",16,-246)
    
    local Button = CreateFrame("button","BtnToggleAuraInfo", MPR_Options, "UIPanelButtonTemplate")
    Button:SetHeight(18)
    Button:SetWidth(60)
    Button:SetPoint("TOPLEFT", 14, -264)
    Button:SetText("Show")
    Button:SetScript("OnShow", function(self) Button:SetText(MPR_AuraInfo:IsVisible() and "Hide" or "Show") end)
    Button:SetScript("OnClick", function(self)
        if not MPR_AuraInfo:IsVisible() then 
            MPR_AuraInfo:UpdateFrame()
            Button:SetText("Hide")
        else 
            MPR_AuraInfo:Hide() 
            Button:SetText("Show")
        end
    end)
    
    -- Frame Update Period slider --
    MPR_Slider = CreateFrame("Slider", "MPR_Slider", MPR_Options, "OptionsSliderTemplate")
    MPR_Slider:SetWidth(120)
    MPR_Slider:SetHeight(20)
    MPR_Slider:SetPoint('TOPLEFT', 84, -248)
    MPR_Slider:SetOrientation('HORIZONTAL')
    
    MPR_Slider:SetMinMaxValues(0.1, 3)
    MPR_Slider:SetValueStep(0.1)
    
    MPR_Slider:SetValue(MPR.Settings["UPDATEFREQUENCY"])
    
    _G[MPR_Slider:GetName().."Low"]:SetText("0.1")
    _G[MPR_Slider:GetName().."High"]:SetText("3")
    _G[MPR_Slider:GetName().."Text"]:SetText("|cFFffffffUpdate Period: "..round(MPR_Slider:GetValue(),1).."s|r")
    
    MPR_Slider:SetScript("OnValueChanged",function()
        _G[MPR_Slider:GetName()..'Text']:SetText("|cFFffffffUpdate Period: "..round(MPR_Slider:GetValue(),1).."s|r")
        MPR.Settings["UPDATEFREQUENCY"] = round(MPR_Slider:GetValue(),1)
    end)
    
    -- Timers
    MPR_Options:NewFS("Timers","1E90FF",16,-284)
    MPR_Options:NewCB("Enable","FFFFFF","TIMERS",60,-282)
    local Button2 = CreateFrame("button","BtnToggleTimers", MPR_Options, "UIPanelButtonTemplate")
    Button2:SetHeight(18)
    Button2:SetWidth(60)
    Button2:SetPoint("TOPLEFT", 116, -282)
    Button2:SetText("Show")
    Button2:SetScript("OnShow", function(self) Button2:SetText(MPR_Timers:IsVisible() and "Hide" or "Show") end)
    Button2:SetScript("OnClick", function(self)
        MPR_Timers:Toggle()
        Button2:SetText(MPR_Timers:IsVisible() and "Hide" or "Show")
    end)
    
    --[[ Miscellaneous ]]--
    MPR_Options:NewFS("Miscellaneous","00CCFF",216,-30)
    MPR_Options:NewCB("Automatic combat log clear",nil,"CCL_ONLOAD",214,-44)    -- [ ] ClearEntriesOnLoad
    MPR_Options:NewCB("Spell Icons (|r\124T"..select(3, GetSpellInfo(33054))..":12:12:0:0:64:64:5:59:5:59\124t "..GetSpellLink(33054)..")",nil,"ICONS",214,-58) -- [ ] Spell Icons
    
    -- Masterloot
    MPR_Options:NewFS("Masterloot","3CB371",216,-77)
    MPR_Options:NewCB("Report |cFFB048F8epic|r items in loot",nil,"REPORT_LOOT", 214, -88)    -- [ ] ReportLoot
    MPR_Options:NewCB("Only when BoP in loot",nil,"nil", 234, -102) -- [ ] ReportOnlyWhenBOP    REPORT_LOOT_BOP_ONLY
    MPR_Options:NewCB("Add BiS information",nil,"REPORT_LOOT_BIS_INFO", 234, -116) -- [ ] AddClassBISinfo
    
    -- Window Style
    MPR_Options:NewFS("Window Style","FF9912",216,-135)
    MPR_Options:NewFS("Border Color:","FFFFFF",219,-148)
    -- BLACK (1E90FF / 0 0 0)
    MPR_Options.CB_Black = CreateFrame("CheckButton", "CB_Black", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Black:SetWidth(20)
    MPR_Options.CB_Black:SetHeight(20)
    MPR_Options.CB_Black:SetPoint("TOPLEFT", 307, -146)
    _G["CB_BlackText"]:SetTextColor(0/255, 0/255, 0/255)
    _G["CB_BlackText"]:SetText("Black")
    MPR_Options.CB_Black:SetScript("OnShow",  function(self) MPR_Options.CB_Black:SetChecked(MPR.Settings["BACKDROPBORDERCOLOR"].R == 0 and MPR.Settings["BACKDROPBORDERCOLOR"].G == 0 and MPR.Settings["BACKDROPBORDERCOLOR"].B == 0) end)
    MPR_Options.CB_Black:SetScript("OnClick", function(self)
        MPR_Options:UncheckColors()
        MPR_Options.CB_Black:SetChecked(true)
        MPR.Settings["BACKDROPBORDERCOLOR"] = {R = 0, G = 0, B = 0}
        MPR.Colors["TITLE"] = "000000"
        MPR:UpdateBackdrop()
    end)
    -- WHITE (FFFFFF / 255 255 255)
    MPR_Options.CB_White = CreateFrame("CheckButton", "CB_White", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_White:SetWidth(20)
    MPR_Options.CB_White:SetHeight(20)
    MPR_Options.CB_White:SetPoint("TOPLEFT", 350, -146)
    _G["CB_WhiteText"]:SetTextColor(255/255, 255/255, 255/255)
    _G["CB_WhiteText"]:SetText("White")
    MPR_Options.CB_White:SetScript("OnShow",  function(self) MPR_Options.CB_White:SetChecked(MPR.Settings["BACKDROPBORDERCOLOR"].R == 255 and MPR.Settings["BACKDROPBORDERCOLOR"].G == 255 and MPR.Settings["BACKDROPBORDERCOLOR"].B == 255) end)
    MPR_Options.CB_White:SetScript("OnClick", function(self)
        MPR_Options:UncheckColors()
        MPR_Options.CB_White:SetChecked(true)
        MPR.Settings["BACKDROPBORDERCOLOR"] = {R = 255, G = 255, B = 255}
        MPR.Colors["TITLE"] = "FFFFFF"
        MPR:UpdateBackdrop()
    end)
    -- BLUE (1E90FF / 30 144 255)
    MPR_Options.CB_Blue = CreateFrame("CheckButton", "CB_Blue", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Blue:SetWidth(20)
    MPR_Options.CB_Blue:SetHeight(20)
    MPR_Options.CB_Blue:SetPoint("TOPLEFT", 219, -159)
    _G["CB_BlueText"]:SetTextColor(30/255, 144/255, 255/255)
    _G["CB_BlueText"]:SetText("Blue")
    MPR_Options.CB_Blue:SetScript("OnShow",  function(self) MPR_Options.CB_Blue:SetChecked(MPR.Settings["BACKDROPBORDERCOLOR"].R == 30 and MPR.Settings["BACKDROPBORDERCOLOR"].G == 144 and MPR.Settings["BACKDROPBORDERCOLOR"].B == 255) end)
    MPR_Options.CB_Blue:SetScript("OnClick", function(self)
        MPR_Options:UncheckColors()
        MPR_Options.CB_Blue:SetChecked(true)
        MPR.Settings["BACKDROPBORDERCOLOR"] = {R = 30, G = 144, B = 255}
        MPR.Colors["TITLE"] = "1E90FF"
        MPR:UpdateBackdrop()
    end)
    -- GREEN (00CC33 / 0 204 51)
    MPR_Options.CB_Green = CreateFrame("CheckButton", "CB_Green", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Green:SetWidth(20)
    MPR_Options.CB_Green:SetHeight(20)
    MPR_Options.CB_Green:SetPoint("TOPLEFT", 261, -159)
    _G["CB_GreenText"]:SetTextColor(0/255, 204/255, 51/255)
    _G["CB_GreenText"]:SetText("Green")
    MPR_Options.CB_Green:SetScript("OnShow",  function(self) MPR_Options.CB_Green:SetChecked(MPR.Settings["BACKDROPBORDERCOLOR"].R == 0 and MPR.Settings["BACKDROPBORDERCOLOR"].G == 204 and MPR.Settings["BACKDROPBORDERCOLOR"].B == 51) end)
    MPR_Options.CB_Green:SetScript("OnClick", function(self)
        MPR_Options:UncheckColors()
        MPR_Options.CB_Green:SetChecked(true)
        MPR.Settings["BACKDROPBORDERCOLOR"] = {R = 0, G = 204, B = 51}
        MPR.Colors["TITLE"] = "00CC33"
        MPR:UpdateBackdrop()
    end)
    -- YELLOW (FFCC00 / 255 204 0)
    MPR_Options.CB_Yellow = CreateFrame("CheckButton", "CB_Yellow", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Yellow:SetWidth(20)
    MPR_Options.CB_Yellow:SetHeight(20)
    MPR_Options.CB_Yellow:SetPoint("TOPLEFT", 311, -159)
    _G["CB_YellowText"]:SetTextColor(255/255, 204/255, 0/255)
    _G["CB_YellowText"]:SetText("Yellow")
    MPR_Options.CB_Yellow:SetScript("OnShow",  function(self) MPR_Options.CB_Yellow:SetChecked(MPR.Settings["BACKDROPBORDERCOLOR"].R == 255 and MPR.Settings["BACKDROPBORDERCOLOR"].G == 204 and MPR.Settings["BACKDROPBORDERCOLOR"].B == 0) end)
    MPR_Options.CB_Yellow:SetScript("OnClick", function(self)
        MPR_Options:UncheckColors()
        MPR_Options.CB_Yellow:SetChecked(true)
        MPR.Settings["BACKDROPBORDERCOLOR"] = {R = 255, G = 204, B = 0}
        MPR.Colors["TITLE"] = "FFCC00"
        MPR:UpdateBackdrop()
    end)
    -- RED (FF0033 / 255 0 51)
    MPR_Options.CB_Red = CreateFrame("CheckButton", "CB_Red", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Red:SetWidth(20)
    MPR_Options.CB_Red:SetHeight(20)
    MPR_Options.CB_Red:SetPoint("TOPLEFT", 363, -159)
    _G["CB_RedText"]:SetTextColor(255/255, 0/255, 51/255)
    _G["CB_RedText"]:SetText("Red")
    MPR_Options.CB_Red:SetScript("OnShow",  function(self) MPR_Options.CB_Red:SetChecked(MPR.Settings["BACKDROPBORDERCOLOR"].R == 255 and MPR.Settings["BACKDROPBORDERCOLOR"].G == 0 and MPR.Settings["BACKDROPBORDERCOLOR"].B == 51) end)
    MPR_Options.CB_Red:SetScript("OnClick", function(self)
        MPR_Options:UncheckColors()
        MPR_Options.CB_Red:SetChecked(true)
        MPR.Settings["BACKDROPBORDERCOLOR"] = {R = 255, G = 0, B = 51}
        MPR.Colors["TITLE"] = "FF0033"
        MPR:UpdateBackdrop()
    end)
    -- SEAGREEN (20B2AA / 32 178 170)
    MPR_Options.CB_SeaGreen = CreateFrame("CheckButton", "CB_SeaGreen", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_SeaGreen:SetWidth(20)
    MPR_Options.CB_SeaGreen:SetHeight(20)
    MPR_Options.CB_SeaGreen:SetPoint("TOPLEFT", 219, -173)
    _G["CB_SeaGreenText"]:SetTextColor(32/255, 178/255, 170/255)
    _G["CB_SeaGreenText"]:SetText("SeaGreen")
    MPR_Options.CB_SeaGreen:SetScript("OnShow",  function(self) MPR_Options.CB_SeaGreen:SetChecked(MPR.Settings["BACKDROPBORDERCOLOR"].R == 32 and MPR.Settings["BACKDROPBORDERCOLOR"].G == 178 and MPR.Settings["BACKDROPBORDERCOLOR"].B == 170) end)
    MPR_Options.CB_SeaGreen:SetScript("OnClick", function(self)
        MPR_Options:UncheckColors()
        MPR_Options.CB_SeaGreen:SetChecked(true)
        MPR.Settings["BACKDROPBORDERCOLOR"] = {R = 32, G = 178, B = 170}
        MPR.Colors["TITLE"] = "20B2AA"
        MPR:UpdateBackdrop()
    end)
    -- ORANGE (FFA500 / 255 165 0)
    MPR_Options.CB_Orange = CreateFrame("CheckButton", "CB_Orange", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Orange:SetWidth(20)
    MPR_Options.CB_Orange:SetHeight(20)
    MPR_Options.CB_Orange:SetPoint("TOPLEFT", 286, -173)
    _G["CB_OrangeText"]:SetTextColor(255/255, 165/255, 0/255)
    _G["CB_OrangeText"]:SetText("Orange")
    MPR_Options.CB_Orange:SetScript("OnShow",  function(self) MPR_Options.CB_Orange:SetChecked(MPR.Settings["BACKDROPBORDERCOLOR"].R == 255 and MPR.Settings["BACKDROPBORDERCOLOR"].G == 165 and MPR.Settings["BACKDROPBORDERCOLOR"].B == 0) end)
    MPR_Options.CB_Orange:SetScript("OnClick", function(self)
        MPR_Options:UncheckColors()
        MPR_Options.CB_Orange:SetChecked(true)
        MPR.Settings["BACKDROPBORDERCOLOR"] = {R = 255, G = 165, B = 0}
        MPR.Colors["TITLE"] = "FFA500"
        MPR:UpdateBackdrop()
    end)
    -- Purple (800080, 128 0 128)
    MPR_Options.CB_Purple = CreateFrame("CheckButton", "CB_Purple", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_Purple:SetWidth(20)
    MPR_Options.CB_Purple:SetHeight(20)
    MPR_Options.CB_Purple:SetPoint("TOPLEFT", 344, -173)
    _G["CB_PurpleText"]:SetTextColor(128/255, 0/255, 128/255)
    _G["CB_PurpleText"]:SetText("Purple")
    MPR_Options.CB_Purple:SetScript("OnShow",  function(self) MPR_Options.CB_Purple:SetChecked(MPR.Settings["BACKDROPBORDERCOLOR"].R == 128 and MPR.Settings["BACKDROPBORDERCOLOR"].G == 0 and MPR.Settings["BACKDROPBORDERCOLOR"].B == 128) end)
    MPR_Options.CB_Purple:SetScript("OnClick", function(self)
        MPR_Options:UncheckColors()
        MPR_Options.CB_Purple:SetChecked(true)
        MPR.Settings["BACKDROPBORDERCOLOR"] = {R = 128, G = 0, B = 128}
        MPR.Colors["TITLE"] = "800080"
        MPR:UpdateBackdrop()
    end)
    
    -- Opacity slider --
    local OpacityValue = MPR.Settings["BACKDROPCOLOR"][4]*100
    MPR_OpacitySlider = CreateFrame("Slider", "MPR_OpacitySlider", MPR_Options, "OptionsSliderTemplate")
    MPR_OpacitySlider:SetWidth(160)
    MPR_OpacitySlider:SetHeight(20)
    MPR_OpacitySlider:SetPoint('TOPLEFT', 222, -208)
    MPR_OpacitySlider:SetOrientation('HORIZONTAL')
    
    MPR_OpacitySlider:SetMinMaxValues(0, 100)
    MPR_OpacitySlider:SetValueStep(1)
    
    MPR_OpacitySlider:SetValue(OpacityValue)
    
    _G[MPR_OpacitySlider:GetName().."Low"]:SetText("0%")
    _G[MPR_OpacitySlider:GetName().."High"]:SetText("100%")
    _G[MPR_OpacitySlider:GetName().."Text"]:SetText("|cFFffffffOpacity: "..OpacityValue.."%|r |cFFbebebe(Default: 70%)|r")
    
    MPR_OpacitySlider:SetScript("OnValueChanged",function()
        _G[MPR_OpacitySlider:GetName()..'Text']:SetText("|cFFffffffOpacity: "..MPR_OpacitySlider:GetValue().."%|r |cFFbebebe(Default: 70%)|r")
        MPR.Settings["BACKDROPCOLOR"][4] = MPR_OpacitySlider:GetValue()/100
        MPR:UpdateBackdrop()
    end)
    
    -- Killing blow
    MPR_Options:NewFS("Killing blow","990099",216,-238)
    MPR_Options:NewCB("Enable","FFFFFF","KILLINGBLOW",288,-236)
    MPR_Options:NewFS("Announces killing blow/finishing damage","FFFFFF",218,-252,9)
    MPR_Options:NewFS("on boss in |cFFEE7600raid|r channel.","FFFFFF",218,-262,9)
    MPR_Options:NewFS("Display:","FFFFFF",218,-274,11)
    MPR_Options:NewCB("Ability",nil,"KILLINGBLOW_ABILITY",268,-270)
    MPR_Options:NewCB("Ammount",nil,"KILLINGBLOW_AMOUNT",216,-284)
    MPR_Options:NewCB("Overkill",nil,"KILLINGBLOW_OVERKILL",289,-284)
    MPR_Options:NewCB("Critical",nil,"KILLINGBLOW_CRITICAL",349,-284)
    local Button = CreateFrame("button","BtnTestKillingBlow", MPR_Options, "UIPanelButtonTemplate")
    Button:SetHeight(18)
    Button:SetWidth(60)
    Button:SetPoint("TOPLEFT", 332, -266)
    Button:SetText("Test")
    Button:SetScript("OnClick", function(self)
        MPR:SelfReport(MPR:FormatKillingBlow("Herbaliist","Squirrel",GetSpellLink(49238),8,21350,true))
    end)
    
    --[[
    --if not CanEditOfficerNote() then return end
    
    -- DKP Deductions
    MPR_Options:NewFS("DKP Deductions","FF9912",216,-107)
    MPR_Options:NewCB("Automatic",nil,"DKPPENALTIES_AUTO",310,-105)    -- [ ] Automatic
    
    MPR_Options.CB_WHISPER = CreateFrame("CheckButton", "CB_WHISPER", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_WHISPER:SetWidth(20)
    MPR_Options.CB_WHISPER:SetHeight(20)
    MPR_Options.CB_WHISPER:SetPoint("TOPLEFT", 214, -118)
    local Color = "DA70D6"
    _G["CB_WHISPERText"]:SetTextColor(tonumber(Color:sub(1,2),16)/255, tonumber(Color:sub(3,4),16)/255, tonumber(Color:sub(5,6),16)/255)
    _G["CB_WHISPERText"]:SetText("Whisper")
    MPR_Options.CB_WHISPER:SetScript("OnShow",  function(self) MPR_Options.CB_WHISPER:SetChecked(MPR.Settings["DKPPENALTIES_OUTPUT"] == "WHISPER") end)
    MPR_Options.CB_WHISPER:SetScript("OnClick", function(self) MPR.Settings["DKPPENALTIES_OUTPUT"] = "WHISPER"; MPR_Options:HandleChecks() end)
    
    MPR_Options.CB_RAID = CreateFrame("CheckButton", "CB_RAID", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_RAID:SetWidth(20)
    MPR_Options.CB_RAID:SetHeight(20)
    MPR_Options.CB_RAID:SetPoint("TOPLEFT", 276, -118)
    local Color = "EE7600"
    _G["CB_RAIDText"]:SetTextColor(tonumber(Color:sub(1,2),16)/255, tonumber(Color:sub(3,4),16)/255, tonumber(Color:sub(5,6),16)/255)
    _G["CB_RAIDText"]:SetText("Raid")
    MPR_Options.CB_RAID:SetScript("OnShow",  function(self) MPR_Options.CB_RAID:SetChecked(MPR.Settings["DKPPENALTIES_OUTPUT"] == "RAID") end)
    MPR_Options.CB_RAID:SetScript("OnClick", function(self) MPR.Settings["DKPPENALTIES_OUTPUT"] = "RAID"; MPR_Options:HandleChecks() end)
    
    MPR_Options.CB_GUILD = CreateFrame("CheckButton", "CB_GUILD", MPR_Options, "UICheckButtonTemplate")
    MPR_Options.CB_GUILD:SetWidth(20)
    MPR_Options.CB_GUILD:SetHeight(20)
    MPR_Options.CB_GUILD:SetPoint("TOPLEFT", 320, -118)
    local Color = "40FF40"
    _G["CB_GUILDText"]:SetTextColor(tonumber(Color:sub(1,2),16)/255, tonumber(Color:sub(3,4),16)/255, tonumber(Color:sub(5,6),16)/255)
    _G["CB_GUILDText"]:SetText("Guild")
    MPR_Options.CB_GUILD:SetScript("OnShow",  function(self) MPR_Options.CB_GUILD:SetChecked(MPR.Settings["DKPPENALTIES_OUTPUT"] == "GUILD") end)
    MPR_Options.CB_GUILD:SetScript("OnClick", function(self) MPR.Settings["DKPPENALTIES_OUTPUT"] = "GUILD"; MPR_Options:HandleChecks() end)
    
    MPR_Options:NewFS("AoE Spell",nil,214,Pack_PosY-4)
    MPR_Options:NewFS("Amount",nil,350,Pack_PosY-4)
    Pack_PosY = Pack_PosY - 16
    for SpellName, Data in pairs(MPR.DKPPenalties) do
        local Enabled, Amount = Data
        MPR_Options:NewPack(SpellName,Enabled,Amount)
        Pack_PosY = Pack_PosY - 14
    end
    ]]
end

function MPR_Options:ID_HandleOnShow()
    local Index = tonumber(MPR_Options.FS_ID:GetText())
    if MPR.DataDeaths[Index+1] then MPR_Options.BTN_ID_MORE:Enable() else MPR_Options.BTN_ID_MORE:Disable() end
    if MPR.DataDeaths[Index-1] then MPR_Options.BTN_ID_LESS:Enable() else MPR_Options.BTN_ID_LESS:Disable() end
    if MPR.DataDeaths[Index] then MPR_Options.BTN_REPORT:Enable() else MPR_Options.BTN_REPORT:Disable() end
end

function MPR_Options:ID_HandleOnClick(num)
    local Index = tonumber(MPR_Options.FS_ID:GetText())
    local Data = MPR.DataDeaths[Index+(MPR.DataDeaths[Index+num] and num or 0)] or nil
    MPR_Options.FS_ID:SetText(Index+(MPR.DataDeaths[Index+num] and num or 0))
    MPR_Options.FS_ID_NAME:SetText(Data and "|cFF"..(Data.Color or "FFFFFF")..Data.Name.."|r|cFFBEBEBE: "..#Data.Deaths.." deaths,|r" or "")
    MPR_Options.FS_ID_TIME:SetText(Data and Data.GameTimeStart.." - "..Data.GameTimeEnd..", "..Data.Date or "")
    if Data then MPR_Options.BTN_REPORT:Enable() else MPR_Options.BTN_REPORT:Disable() end
    MPR_Options:ID_HandleOnShow()
end

function MPR_Options:UncheckColors()
    MPR_Options.CB_Black:SetChecked(false)
    MPR_Options.CB_White:SetChecked(false)
    MPR_Options.CB_Blue:SetChecked(false)
    MPR_Options.CB_Green:SetChecked(false)
    MPR_Options.CB_Yellow:SetChecked(false)
    MPR_Options.CB_Red:SetChecked(false)
    MPR_Options.CB_SeaGreen:SetChecked(false)
    MPR_Options.CB_Orange:SetChecked(false)
    MPR_Options.CB_Purple:SetChecked(false)
end

Pack_PosY = -133
function MPR_Options:NewPack(SpellName,Enabled,Amount)
    local CheckBox = CreateFrame("CheckButton", "CheckBox"..GetNewID(), MPR_Options, "UICheckButtonTemplate")
    CheckBox:SetWidth(20)
    CheckBox:SetHeight(20)
    CheckBox:SetPoint("TOPLEFT", 213, Pack_PosY)
    if type(Color) ~= "string" then Color = "FFFFFF" end
    _G["CheckBox"..GetCurrentID().."Text"]:SetTextColor(tonumber(Color:sub(1,2),16)/255, tonumber(Color:sub(3,4),16)/255, tonumber(Color:sub(5,6),16)/255)
    _G["CheckBox"..GetCurrentID().."Text"]:SetText("["..SpellName.."]")
    CheckBox:SetScript("OnShow",  function(self) CheckBox:SetChecked(MPR.DKPPenalties[SpellName][1]) end)
    CheckBox:SetScript("OnClick", function(self) MPR.DKPPenalties[SpellName][1] = not MPR.DKPPenalties[SpellName][1] end)
    
    local Label = MPR_Options:CreateFontString("Label"..GetNewID(), "ARTWORK", "GameFontNormal")
    Label:SetPoint("TOPLEFT", 378, Pack_PosY)
    if type(Color) ~= "string" then Color = "FFFFFF" end
    Label:SetTextColor(tonumber(Color:sub(1,2),16)/255, tonumber(Color:sub(3,4),16)/255, tonumber(Color:sub(5,6),16)/255) 
    Label:SetText(MPR.DKPPenalties[SpellName][2])
    
    local Button = CreateFrame("button","BtnDKPMore"..GetCurrentID(), MPR_Options, "UIPanelButtonTemplate")
    Button:SetHeight(14)
    Button:SetWidth(14)
    Button:SetPoint("TOPLEFT", 350, Pack_PosY)
    Button:SetText("+")
    Button:SetScript("OnClick", function(self) MPR.DKPPenalties[SpellName][2] = MPR.DKPPenalties[SpellName][2] + 1; Label:SetText(MPR.DKPPenalties[SpellName][2]) end)
    
    local Button = CreateFrame("button","BtnDKPLess"..GetCurrentID(), MPR_Options, "UIPanelButtonTemplate")
    Button:SetHeight(14)
    Button:SetWidth(14)
    Button:SetPoint("TOPLEFT", 364, Pack_PosY)
    Button:SetText("-")
    Button:SetScript("OnClick", function(self) if MPR.DKPPenalties[SpellName][2] > 1 then MPR.DKPPenalties[SpellName][2] = MPR.DKPPenalties[SpellName][2] - 1 end; Label:SetText(MPR.DKPPenalties[SpellName][2]) end)
end

function MPR_Options:HandleChecks()
    MPR_Options.CB_WHISPER:SetChecked(MPR.Settings["DKPPENALTIES_OUTPUT"] == "WHISPER")
    MPR_Options.CB_RAID:SetChecked(MPR.Settings["DKPPENALTIES_OUTPUT"] == "RAID")
    MPR_Options.CB_GUILD:SetChecked(MPR.Settings["DKPPENALTIES_OUTPUT"] == "GUILD")
end

function MPR_Options:NewFS(Text,Color,LocX,LocY,Size) -- Creates a fontstring
    local Title = MPR_Options:CreateFontString("Title"..GetNewID(), "ARTWORK", "GameFontNormal")
    Title:SetPoint("TOPLEFT", LocX, LocY)
    if type(Color) ~= "string" then Color = "FFFFFF" end
    Title:SetTextColor(tonumber(Color:sub(1,2),16)/255, tonumber(Color:sub(3,4),16)/255, tonumber(Color:sub(5,6),16)/255)
    Title:SetFont("Fonts\\FRIZQT__.TTF", Size or 12, "OUTLINE")
    Title:SetText(Text)
end

function MPR_Options:NewCB(Text,Color,Var,LocX,LocY) -- Creates a checkbox
    local CheckBox = CreateFrame("CheckButton", "CheckBox"..GetNewID(), MPR_Options, "UICheckButtonTemplate")
    CheckBox:SetWidth(20)
    CheckBox:SetHeight(20)
    CheckBox:SetPoint("TOPLEFT", LocX, LocY)
    if type(Color) ~= "string" then Color = "FFFFFF" end
    if Var == "nil" then Color = "BEBEBE" end
    _G["CheckBox"..GetCurrentID().."Text"]:SetTextColor(tonumber(Color:sub(1,2),16)/255, tonumber(Color:sub(3,4),16)/255, tonumber(Color:sub(5,6),16)/255)
    _G["CheckBox"..GetCurrentID().."Text"]:SetText(Text)
    if Var ~= "nil" then
        CheckBox:SetScript("OnShow",  function(self) CheckBox:SetChecked(MPR.Settings[Var]) end)
        CheckBox:SetScript("OnClick", function(self)
            MPR.Settings[Var] = not MPR.Settings[Var]
            if MPR.Settings[Var] and (Var == "RAID" or Var == "SAY" or Var == "WHISPER" or Var == "PD_RAID" or Var == "PD_WHISPER" or Var == "PD_GUILD" or Var == "KILLINGBLOW") then
                CheckRaidOptions(Var)
            end
        end)
    else
        CheckBox:Disable()
    end
end