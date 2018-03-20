MPR_Timers = CreateFrame("Frame", "MPR LK Timers", UIParent)
MPR_Timers.TimeSinceLastUpdate = 0
MPR_Timers.LichKingWarnings = {
-- Will warn: "Warning: The Lich King has {%%}% HP remaining! {Message}"
--  [%%] = {Warned, Message},
    [77] = {false, nil},
    [74] = {false, "Transition soon!"},
    [47] = {false, nil},
    [44] = {false, "Transition soon!"},
}
MPR_Timers.QuakeCount = 0
MPR_Timers.InfoTimers = {
    [1] = {
        [1] = {['name'] = "Cementerio de púas osarias",    ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 1},
        [2] = {['name'] = "Tormenta ósea",                ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 2},
    },
    [2] = {
        [1] = {['name'] = "Nuevos adds",            ['format'] = "{Name}: {Time}",            ['label'] = 1},
        [2] = {['name'] = "Invocar Sombra vengativa",    ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 2},
    },
    [3] = {
        [1] = {['name'] = "Below Zero",                ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 1},
    },
    [4] = {
        [1] = {['name'] = "Runa sangrienta",            ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 1},
    },
    [5] = {
        [1] = {['name'] = "Espora de gas",                ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 1},
        [2] = {['name'] = "Hinchazón gástrica",            ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 2},
    },
    [6] = {
        [1] = {['name'] = "Pulverizador de babas",            ['format'] = "{SpellLink}: {Time}",        ['label'] = 1},
        [2] = {['name'] = "Infección mutada",        ['format'] = "{SpellLink}: {Time}",        ['label'] = 2},
        [3] = {['name'] = "Gas inmundo",                ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 3},
    },
    [7] = {
        [1] = {['name'] = "Experimento inestable",    ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 1},
        [2] = {['name'] = "Moco maleable",            ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 2},
        [3] = {['name'] = "Bomba de gas asfixiante",        ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 3},
    },
    [8] = {
        [1] = {['name'] = "Target Switch",            ['format'] = "{Name}: {Time}",            ['label'] = 1},
        [2] = {['name'] = "Empowered Shock Vortex",    ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 2},
        [3] = {['name'] = "Shadow Resonance",        ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 3},
    },
    [9] = {
        [1] = {['name'] = "Incitar terror",            ['format'] = "{SpellLink}: {Time}",        ['label'] = 1},
        [2] = {['name'] = "Sombras enjambradoras",        ['format'] = "{SpellLink}: {Time}",        ['label'] = 2},
        [3] = {['name'] = "Rabia",                ['format'] = "{SpellLink}: {Time}",        ['label'] = 3},
    },
    [10] = {
        [1] = {['name'] = "Summon Portal",            ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 1},
    },
    [11] = {
        [1] = {['name'] = "Frío virulento",        ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 1},
        [2] = {['name'] = "Fase aérea",                ['format'] = "{Name}: {Time}",            ['label'] = 2},
        [3] = {['name'] = "Señal de Escarcha",            ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 2},
    },
    [12] = {
        [1] = {['name'] = "Invocar Trampa de las Sombras",       ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 2},
        [2] = {['name'] = "Invocar Val'kyr",           ['format'] = "{SpellLink}: {Time}",       ['label'] = 1},
        [3] = {['name'] = "Profanar",                   ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 2},
        [4] = {['name'] = "Recolectar alma/s",           ['format'] = "{SpellLink}: {Time}",       ['label'] = 1},
        [5] = {['name'] = "Espíritu enfurecido",            ['format'] = "{Name} CD: {Time}",         ['label'] = 1},
        [6] = {['name'] = "Quake",                    ['format'] = "{SpellLink}: {Time}",       ['label'] = 2},
        [7] = {['name'] = "Peste necrótica",          ['format'] = "{SpellLink}: {Time}",       ['label'] = 1},
    },
    [13] = {
        [1] = {['name'] = "Impale",                   ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 1},
        [2] = {['name'] = "Staggering Stomp",         ['format'] = "{SpellLink}: {Time}",       ['label'] = 2},
        [3] = {['name'] = "Rising Anger",             ['format'] = "{SpellLink} CD: {Time}",    ['label'] = 3},
    },
    [14] = {
        [1] = {['name'] = "Slime Pool",               ['format'] = "{SpellLink}: {Time}",    ['label'] = 1},
    },
    [20] = {
        [1] = {['name'] = "Enfurecer",                   ['format'] = "{SpellLink} CD: {Time}", ['label'] = 1},
        [2] = {['name'] = "Fase aérea",                ['format'] = "{Name}: {Time}",         ['label'] = 2},
    },
    [21] = {
        [1] = {['name'] = "Blade Tempest",            ['format'] = "{SpellLink} 1: {Time}",  ['label'] = 1},
        [2] = {['name'] = "Blade Tempest",            ['format'] = "{SpellLink} 2: {Time}",  ['label'] = 2},
        [3] = {['name'] = "Blade Tempest",            ['format'] = "{SpellLink} 3: {Time}",  ['label'] = 3},
    },
    [22] = {
        [1] = {['name'] = "Cleave Armor",             ['format'] = "{SpellLink}: {Time}",  ['label'] = 1},
        [2] = {['name'] = "Summon Adds",              ['format'] = "{Name}: {Time}",       ['label'] = 2},
        [3] = {['name'] = "Intimidating Roar",        ['format'] = "{SpellLink}: {Time}",  ['label'] = 3},
    },
    [23] = {
        [1] = {['name'] = "Golpe de meteorito",       ['format'] = "{SpellLink}: {Time}",    ['label'] = 1},
        [2] = {['name'] = "Combustión ígnea",         ['format'] = "{SpellLink}: {Time}",    ['label'] = 2},
        [3] = {['name'] = "Corte Crepuscular",          ['format'] = "{SpellLink}: {Time}",    ['label'] = 1},
        [4] = {['name'] = "Consumo de alma",          ['format'] = "{SpellLink}: {Time}",    ['label'] = 2},
    },
}
-- structure generated as timers are set
MPR_Timers.DataTimers = {[1] = {}, [2] = {}, [3] = {}, [4] = {}, [5] = {}, [6] = {}, [7] = {}, [8] = {}, [9] = {}, [10] = {}, [11] = {}, [12] = {}, [13] = {}, [20] = {}, [21] = {}, [22] = {}, [23] = {}}
MPR_Timers.DefaultTimerAnnounces = {
-- EXAMPLE:
--  [EncounterID] = {
--      [AbilityID] = {[Second] = {false, IconID}, [Second2] = {false, IconID}},
--  },
--[[ letting people tick announces for themselves in options
    [7] = { -- PP
        [1] = {[5] = {false, 7}},
        [2] = {[5] = {false, 8}, [3] = {false, 8}},
        [3] = {[5] = {false, 2}},
    },
    [8] = { -- BPC
        [1] = {[10] = {false, 3}, [5] = {false, 3}},
    },
    [9] = { -- BQL
        [1] = {[20] = {false, 3}, [10] = {false, 3}}, -- Incite Terror: 20s,10s
        [2] = {[5] = {false, 7}}, -- Swarming Shadows: 5s
        [3] = {[30] = {false, 8}, [20] = {false, 8}, [10] = {false, 8}, [5] = {false, 7}}, -- Berserk: 30s,20s,10s,5s
    },
    [11] = { -- Sindragosa
        [1] = {[10] = {false, 8}, [5] = {false, 8}},
        [2] = {[10] = {false, 6}, [5] = {false, 6}},
        [3] = {[3] = {false, 7}},
    },
    [12] = { -- LK
        [1] = {[3] = {false, 8}, [2] = {false, 8}, [1] = {false, 8}},
        [2] = {[10] = {false, 4}, [5] = {false, 4}},
        [3] = {[10] = {false, 7}, [5] = {false, 7}},
        [4] = {[10] = {false, 6}, [5] = {false, 6}},
        [5] = {[3] = {false, 4}},
        [6] = {[5] = {false, 3}},
        [7] = {[5] = {false, 4}},
    },
    [23] = { -- Halion
        [1] = {[10] = {false, 2}, [5] = {false, 2}},
        [2] = {[5] = {false, 2}},
        [3] = {[5] = {false, 3}, [3] = {false, 3}},
        [4] = {[5] = {false, 3}},
    },
]]
}
MPR_Timers.ValkyrCount = 0
MPR_Timers.ValkyrTable = {} -- {IconID, Health, HealthMax, Speed}
MPR_Timers.ValkyrUpdated = {}
MPR_Timers.GrabbedPlayers = {}
MPR_Timers.ValkyrObjects = {}
MPR_Timers.BaltharusCount = 0
MPR_Timers.BaltharusTable = {}
MPR_Timers.BossNum = 0
MPR_Timers.Bosses = {[0] = "N/a", [1] = "LK",[2] = "LD", [3] = "GB", [4] = "DB", [5] = "Fes", [6] = "Rot", [7] = "PP", [8] = "BPC", [9] = "BQL", [10] = "VD", [11] = "Sin", [12] = "LK", [23] = "Hal"}
function MPR_Timers:Initialize()
    MPR_Timers:Hide()
    MPR_Timers:SetBackdrop(MPR.Settings["BACKDROP"])
    MPR_Timers:SetBackdropColor(unpack(MPR.Settings["BACKDROPCOLOR"]))
    MPR_Timers:SetBackdropBorderColor(MPR.Settings["BACKDROPBORDERCOLOR"].R/255, MPR.Settings["BACKDROPBORDERCOLOR"].G/255, MPR.Settings["BACKDROPBORDERCOLOR"].B/255)
    MPR_Timers:SetPoint("CENTER",UIParent)
    MPR_Timers:SetWidth(200)
    MPR_Timers:SetHeight(56)
    MPR_Timers:EnableMouse(true)
    MPR_Timers:SetMovable(true)
    MPR_Timers:RegisterForDrag("LeftButton")
    MPR_Timers:SetUserPlaced(true)
    MPR_Timers:SetScript("OnDragStart", function(self) MPR_Timers:StartMoving() end)
    MPR_Timers:SetScript("OnDragStop", function(self) MPR_Timers:StopMovingOrSizing() end)
    MPR_Timers:SetFrameStrata("FULLSCREEN_DIALOG")
    
    MPR_Timers.Title = MPR_Timers:CreateFontString(nil, "OVERLAY", "GameTooltipText")
    MPR_Timers.Title:SetPoint("TOPLEFT", 8, -8)
    MPR_Timers.Title:SetTextColor(190/255, 190/255, 190/255)
    MPR_Timers.Title:SetText("|cff"..MPR.Colors["TITLE"].."MPR|r Timers:")
    MPR_Timers.Title:SetFont("Fonts\\FRIZQT__.TTF", 11, "OUTLINE")
    MPR_Timers.Title:SetShadowOffset(1, -1)
    
    MPR_Timers.Title2 = MPR_Timers:CreateFontString(nil, "OVERLAY", "GameTooltipText")
    MPR_Timers.Title2:SetPoint("LEFT", MPR_Timers.Title, "RIGHT", 0, 0)
    MPR_Timers.Title2:SetTextColor(190/255, 190/255, 190/255)
    MPR_Timers.Title2:SetText("|cFF00CCFF"..MPR.BossData[MPR_Timers.BossNum or 0]["ENCOUNTER"])
    MPR_Timers.Title2:SetFont("Fonts\\FRIZQT__.TTF", 10, "OUTLINE")
    MPR_Timers.Title2:SetShadowOffset(1, -1)
    
    MPR_Timers.CloseButton = CreateFrame("button","BtnClose", MPR_Timers, "UIPanelButtonTemplate")
    MPR_Timers.CloseButton:SetHeight(14)
    MPR_Timers.CloseButton:SetWidth(14)
    MPR_Timers.CloseButton:SetPoint("TOPRIGHT", -8, -8)
    MPR_Timers.CloseButton:SetText("x")
    MPR_Timers.CloseButton:SetScript("OnClick", function(self) MPR_Timers_Options:Hide(); MPR_Timers:Hide() end)
    
    MPR_Timers.OptionsButton = CreateFrame("button","BtnClose", MPR_Timers, "UIPanelButtonTemplate")
    MPR_Timers.OptionsButton:SetHeight(14)
    MPR_Timers.OptionsButton:SetWidth(14)
    MPR_Timers.OptionsButton:SetPoint("TOPRIGHT", -24, -8)
    MPR_Timers.OptionsButton:SetText("o")
    MPR_Timers.OptionsButton:SetScript("OnClick", function(self) MPR_Timers_Options:Show() end)
    
    MPR_Timers.Label1 = MPR_Timers:CreateFontString("Label1", "OVERLAY", "GameTooltipText")
    MPR_Timers.Label1:SetPoint("TOPLEFT", 8, -22)
    MPR_Timers.Label1:SetFont("Fonts\\FRIZQT__.TTF", 10, nil)
    MPR_Timers.Label1:SetText("|cFFbebebeTimer1|r")
    
    MPR_Timers.Label2 = MPR_Timers:CreateFontString("Label2", "OVERLAY", "GameTooltipText")
    MPR_Timers.Label2:SetPoint("TOPLEFT", 8, -36)
    MPR_Timers.Label2:SetFont("Fonts\\FRIZQT__.TTF", 10, nil)
    MPR_Timers.Label2:SetText("|cFFbebebeTimer2|r")
        
    MPR_Timers.Label3 = MPR_Timers:CreateFontString("Label3", "OVERLAY", "GameTooltipText")
    MPR_Timers.Label3:SetPoint("TOPLEFT", 8, -50)
    MPR_Timers.Label3:SetFont("Fonts\\FRIZQT__.TTF", 10, nil)
    MPR_Timers.Label3:SetText("Grabbed: ")
    
    MPR_Timers_Options:Initialize()
end

function MPR_Timers:Toggle()
    if MPR_Timers:IsVisible() then
        MPR_Timers:Hide()
    else
        MPR_Timers:Show()
        if not MPR.Settings["TIMERS"] then
            MPR:SelfReport("Timers are |cFFFF0000disabled|r. |cff3588ff|HMPR:Options:Show|h[Options]|h|r")
        end
    end
end

function MPR_Timers:GetSpellID(spellName)
           -- Lord Marrowgar
    return spellName == "Cementerio de púas osarias"   and 69057 or
           spellName == "Tormenta ósea"             and 69076 or
           -- Lady Deathwhisper
           spellName == "Invocar Sombra vengativa"  and 71426 or
           -- Gunship Battle
           spellName == "Below Zero"             and 69705 or
           -- Deathbringer Saurfang
           spellName == "Runa sangrienta"          and 72410 or
           -- Festergut
           spellName == "Espora de gas"              and 69278 or
           spellName == "Hinchazón gástrica"          and 72219 or
           -- Rotface
           spellName == "Pulverizador de babas"            and 69508 or
           spellName == "Infección mutada"      and 69674 or
           spellName == "Gas inmundo"               and 69240 or
           -- Professor Putricide
           spellName == "Experimento inestable"    and 70351 or
           spellName == "Moco maleable"          and 70852 or
           spellName == "Bomba de gas asfixiante"       and 71255 or
           -- Blood Prince Council
           spellName == "Empowered Shock Vortex" and (self.EmpoweredPrince ~= "Prince Valanar" and 71944 or 72039) or
           spellName == "Shadow Resonance"       and 71943 or
           -- Blood-Queen Lana'thel
           spellName == "Incitar terror"          and 73070 or
           spellName == "Sombras enjambradoras"       and 71264 or
           spellName == "Rabia"                and 26662 or
           -- Valithria Dreamwalker
           spellName == "Summon Portal"          and (self:IsNormal() and 72224 or 72480) or
           -- Sindragosa
           spellName == "Frío virulento"        and 70123 or
           spellName == "Señal de Escarcha"           and 70126 or
           -- The Lich King
           spellName == "Invocar Trampa de las Sombras"     and 73539 or
           spellName == "Trampa de las Sombras"            and 73529 or
           spellName == "Recolectar alma/s"         and (self:IsNormal() and 74325 or 74297) or
           spellName == "Invocar Val'kyr"         and 69037 or
           spellName == "Profanar"                 and 72762 or
           spellName == "Espíritu enfurecido"          and 69200 or
           spellName == "Quake"                  and 72262 or
           spellName == "Peste necrótica"        and self:RaidMode(70337,73912,73913,73914) or
           -- Gormok the Impaler
           spellName == "Impale"                 and 66331 or
           spellName == "Staggering Stomp"       and 67648 or 
           spellName == "Rising Anger"           and 66636 or
           -- Acidmaw & Dreadscale
           spellName == "Slime Pool"             and 66883 or
           -- Saviana Ragefire
           spellName == "Enfurecer"                 and 78722 or
           -- Baltharus the Warborn
           spellName == "Blade Tempest"          and 75125 or
           -- General Zarithrian
           spellName == "Cleave Armor"           and 74367 or
           spellName == "Intimidating Roar"      and 74384 or       
           -- Halion
           spellName == "Golpe de meteorito"     and self:RaidMode(74648,75877,75878,75879) or
           spellName == "Combustión ígnea"       and 74562 or
           spellName == "Corte Crepuscular"        and 74769 or 
           spellName == "Consumo de alma"        and 74792
end

function MPR_Timers:RaidMode(Mode10N, Mode25N, Mode10H, Mode25H)
    local Mode = GetInstanceDifficulty()
    return Mode == 1 and Mode10N or Mode == 2 and Mode25N or Mode == 3 and Mode10H or Mode == 4 and Mode25H
end
function MPR_Timers:IsNormal() return self:RaidMode(true, true, false, false) end
function MPR_Timers:IsHeroic() return self:RaidMode(false, false, true, true) end
function MPR_Timers:Is10Man() return self:RaidMode(true, false, true, false) end
function MPR_Timers:Is25Man() return self:RaidMode(false, true, false, true) end

function MPR_Timers:OnUpdate(elapsed)
    local bWhite = GetTime()%1.5 < 0.75
    
    local Label1HasText = nil
    local Label2HasText = nil
    local Label3HasText = nil
    
    local e = self.BossNum
    if e then
        self.DataTimers[e] = self.DataTimers[e] or {}
        for i,_ in pairs(self.DataTimers[e]) do
            local info = self.InfoTimers[e][i]
            local timer = self.DataTimers[e][i]
            local warns = MPR.Settings["TIMER_ANNOUNCES"][e] and MPR.Settings["TIMER_ANNOUNCES"][e][i] or nil
            
            if timer then -- timer must be set
                local Seconds, String, Color
                Seconds = round(timer,0,true)
                Color = Seconds > 12 and "00FF00" or Seconds > 9 and "FFFF00" or Seconds > 6 and "FFAA00" or Seconds > 3 and "FF7700" or "FF0000"
                String = info['format']:gsub("{SpellLink}",GetSpellLink(self:GetSpellID(info['name']) or 0)):gsub("{Name}",info['name']):gsub("{Time}","|cFF"..Color..Seconds.." sec|r")
                if info['label'] == 1 then
                    self.Label1:SetText(String)
                    self.Label1:Show()
                    Label1HasText = true
                elseif info['label'] == 2 then
                    self.Label2:SetText(String)
                    self.Label2:Show()
                    Label2HasText = true
                elseif info['label'] == 3 then
                    self.Label3:SetText(String)
                    self.Label3:Show()
                    Label3HasText = true
                end
                
                if warns then
                    if warns[Seconds] and not warns[Seconds][1] then
                        warns[Seconds][1] = true
                        local formatted = (warns[Seconds][2] and "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_"..warns[Seconds][2].."|t " or "")..String..(warns[Seconds][2] and " |TInterface\\TargetingFrame\\UI-RaidTargetingIcon_"..warns[Seconds][2].."|t" or "")
                        String = info['format']:gsub("{SpellLink}",GetSpellLink(self:GetSpellID(info['name']) or 0)):gsub("{Name}",info['name']):gsub("{Time}",Seconds.." sec")
                        local unformattted = (warns[Seconds][2] and "{rt"..warns[Seconds][2].."} " or "")..String..(warns[Seconds][2] and " {rt"..warns[Seconds][2].."}" or "")
                        if MPR.Settings["T_RAID"] then
                            MPR:HandleReport(unformattted,formatted,true)
					   elseif MPR.Settings["T_CABEZAZOS"] then
                            MPR:HandleReport(unformattted)
                        elseif MPR.Settings["T_SELF"] then
                            MPR:SelfReport(Formatted)
                        end
                    end
                    if warns[Seconds+1] and warns[Seconds+1][1] then
                        warns[Seconds+1][1] = false
                    end
                end
            end
        end
    end
    
    if not Label3HasText and (e ~= 12 or self.QuakeCount ~= 1) then
        self.Label3:SetText("")
        self.Label3:Hide()
        if not Label2HasText then 
            self.Label2:SetText("")
            self.Label2:Hide()
            if not Label1HasText then
                --self.Label1:SetText("")
                --self.Label1:Hide()
                self.Label1:SetText("No timers active.")
            end
        end
    end
    
    self:SetHeight(Label3HasText and 69 or Label2HasText and 56 or 43)
    
    if e == 12 then -- LK only
        self.TimeSinceLastUpdate = self.TimeSinceLastUpdate + elapsed
        if self.TimeSinceLastUpdate >= MPR.Settings["UPDATEFREQUENCY"] then
            local diff = self.TimeSinceLastUpdate
            self.TimeSinceLastUpdate = 0
            self:Update(diff)
        end
    end
end

local ClassColors = {["DEATHKNIGHT"] = "C41F3B", ["DRUID"] = "FF7D0A", ["HUNTER"] = "ABD473", ["MAGE"] = "69CCF0", ["PALADIN"] = "F58CBA", ["PRIEST"] = "FFFFFF", ["ROGUE"] = "FFF569", ["SHAMAN"] = "0070DE", ["WARLOCK"] = "9482C9", ["WARRIOR"] = "C79C6E"}
function MPR_Timers:Update()
    local countValkyr = 0
    local arrayGrabbed = {}
    local Color = {R = 1, G = 1, B = 1}
    
    local LKHealthPct = nil
    for i=1,GetNumRaidMembers() do
        local UnitIDTarget = (i > 0 and "raid"..i or "").."target"
        if UnitName(UnitIDTarget) == "El Rey Exánime" then
            LKHealthPct = round(100*UnitHealth(UnitIDTarget)/UnitHealthMax(UnitIDTarget),0,true)
            break
        end
    end
    if LKHealthPct and LKHealthPct > 40 and self.LichKingWarnings[LKHealthPct] and not self.LichKingWarnings[LKHealthPct][1] then
        self.LichKingWarnings[LKHealthPct][1] = true
        MPR:HandleReport("Warning: The Lich King has "..LKHealthPct.."% HP remaining! "..(self.LichKingWarnings[LKHealthPct][2] or ""))
    end
    
    if self.QuakeCount == 1 then -- During Phase 2 only
        for i=0,GetNumRaidMembers() do
            local UnitID = i == 0 and "player" or "raid"..i
            
            -- Check if grabbed
            if UnitInVehicle(UnitID) then
                if not self.GrabbedPlayers[UnitName(UnitID)] then -- Insert grabbed player
                    MPR:ReportValkyrGrab(UnitName(UnitID))
                    self.GrabbedPlayers[UnitName(UnitID)] = {} -- {UnitName => TargetMarker}
                    self.GrabbedPlayers[UnitName(UnitID)].Name = string.format("|cFF%s%s|r",ClassColors[strupper(select(2,UnitClass(UnitID)))],UnitName(UnitID))
                    self.GrabbedPlayers[UnitName(UnitID)].Icon = GetRaidTargetIndex(UnitID)
                elseif GetRaidTargetIndex(UnitID) then -- Update grabbed player's icon if we don't have it yet
                    self.GrabbedPlayers[UnitName(UnitID)].Icon = GetRaidTargetIndex(UnitID)
                end
            elseif self.GrabbedPlayers[UnitName(UnitID)] then -- Remove grabbed player
                self.GrabbedPlayers[UnitName(UnitID)] = nil
            end
        end
        
            
        -- Print grabbed players
        for _,Unit in pairs(self.GrabbedPlayers) do
            table.insert(arrayGrabbed,(Unit.Icon and Unit.Icon > 0 and "|TInterface\\TargetingFrame\\UI-RaidTargetingIcon_"..Unit.Icon..":12:12|t" or "")..Unit.Name)
        end
        -- Blinking label if players are grabbed
        if #arrayGrabbed > 0 then
            if GetTime()%1.4 < 0.7 then
                Color = {R = 1, G = 0, B = 0}
            end
        end
        
        self:SetHeight(69)
        MPR_Timers.Label3:Show()
    else
        self.GrabbedPlayers = {}
        self.ValkyrTable = {}
        
        self:SetHeight(56)
        MPR_Timers.Label3:Hide()
    end
    
    self.Label3:SetTextColor(Color.R, Color.G, Color.B)
    self.Label3:SetText("Grabbed: "..table.concat(arrayGrabbed,", "))
end

function MPR_Timers:NewTimer(ability,cd_left,special)
    local TimeInCB = math.floor(GetTime()-MPR.DataDeaths[#MPR.DataDeaths].TimeStart)
    TimeInCB = string.format("%2d:%02d",floor(TimeInCB/60),(TimeInCB%60))
    MPR:SelfReport("|r|cFFFF0000New cooldown! Ability: |r|cFFFFFFFF"..ability.."|r|cFFFF0000; CD Left: |r|cFFFFFFFF"..cd_left.."|r|cFFFF0000 s; Encounter Time: |r|cFFFFFFFF"..TimeInCB.."; Instance Diff.: |r|cFFFFFFFF"..GetInstanceDifficulty().."|r|cFFFF0000"..(special and "; |r|cFFFFFFFF"..special.."|r|cFFFF0000" or "").."). |r|cFFFFFF00|HMPR:CopyUrl:https://github.com/Mihapro/MP-Reporter/issues?labels=timer|h[Open an issue on GitHub!]|h|r|cFFBEBEBE")
end

function MPR_Timers:EncounterStart(ID)
    self:Reset()
    self.DataTimers[ID] = {}
    if ID == 1 then
        self.DataTimers[1][1] = 10
        self.DataTimers[1][2] = 45
    elseif ID == 2 then
        self.LD_Phase = 1
        self.AddsFound = false
        self.DataTimers[2][1] = 5
        self.DataTimers[2][2] = nil
    elseif ID == 3 then
        self.DataTimers[3][1] = 40 --45
    elseif ID == 4 then
        self.DataTimers[4][1] = 20
    elseif ID == 5 then
        self.DataTimers[5][1] = 20
        self.DataTimers[5][2] = 12.5
    elseif ID == 6 then
        self.DataTimers[6][1] = 20
        self.DataTimers[6][2] = 14
        self.DataTimers[6][3] = self:IsHeroic() and 15 or nil
    elseif ID == 7 then
        self.PP_Phase = 1
        self.DataTimers[7][1] = 25
    elseif ID == 8 then
        self.EmpoweredPrince = "Prince Valanar"
        self.DataTimers[8][1] = 45
        self.DataTimers[8][2] = 15
        self.DataTimers[8][3] = 10
    elseif ID == 9 then
        self.DataTimers[9][1] = self:Is25Man() and 127 or 124
        self.DataTimers[9][2] = 28
        self.DataTimers[9][3] = 330
    elseif ID == 10 then
        self.DataTimers[10][1] = 45
    elseif ID == 11 then
        self.SindragosaPhase = 1
        self.DataTimers[11][1] = 36
        self.DataTimers[11][2] = 48
    elseif ID == 12 then
        self.QuakeCount = 0
        self.ValkyrCount = 0
        self.RagingSpiritCount = 0
        self.DataTimers[12][7] = 27
        if self:IsHeroic() then
            self.Label2:Hide() -- Hide Defile label
            self.DataTimers[12][1] = 30
        end
    elseif ID == 13 then
        self.DataTimers[13][1] = 8
        self.DataTimers[13][2] = 15
        self.DataTimers[13][3] = 15
    elseif ID == 14 then
        self.DataTimers[14][1] = 15
    elseif ID == 20 then
        self.DataTimers[20][1] = 15
        self.DataTimers[20][2] = 28
    elseif ID == 21 then
        self.BaltharusCount = 0
        self.BaltharusObjects = {}
        self.DataTimers[21][1] = 12
    elseif ID == 22 then
        self.DataTimers[22][1] = 15
        self.DataTimers[22][2] = 40
        self.DataTimers[22][3] = 42
    elseif ID == 23 then
        self.DataTimers[23][1] = 25
        self.DataTimers[23][2] = 15
    else
        return
    end
    self.BossNum = ID
    self.Title2:SetText("|cFF00CCFF"..MPR.BossData[MPR_Timers.BossNum or 0]["ENCOUNTER"])
end

-- ICECROWN CITADEL
-- 1: Lord Marrowgar
function MPR_Timers:BoneSpikeGraveyard()
    --local cd = round(self.DataTimers[1][1],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Cementerio de púas osarias")),cd,nil) end
    self.DataTimers[1][1] = 15
end
function MPR_Timers:BoneStorm()
    --local cd = round(self.DataTimers[1][2],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Tormenta ósea")),cd,nil) end
    if self:IsNormal() then  
        self.DataTimers[1][1] = self:Is10Man() and 35 or 45
    end
    self.DataTimers[1][2] = 90
end
-- 2: Lady Deathwhisper
MPR_Timers.LD_Phase = 1
function MPR_Timers:WaveSummoned()
    self.DataTimers[2][1] = 60
end
function MPR_Timers:ManaBarrierRemoved()
    self.LD_Phase = 2
    self.DataTimers[2][1] = self:IsHeroic() and 30 or nil
    self.DataTimers[2][2] = 12
end
function MPR_Timers:SummonVengefulShade()
    --local cd = round(self.DataTimers[2][2],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Summon Vengeful Shade")),cd,nil) end
    self.DataTimers[2][2] = 18
end
MPR_Timers.AddsFound = false
function MPR_Timers:SearchForAdds()
    for i=1,GetNumRaidMembers() do
        local t = UnitName("raid"..i.."target")
        if t == "Cult Adherent" or t == "Empowered Adherent" or t == "Reanimated Adherent" then
            return true
        end
    end
end
-- 3: Gunship Battle
function MPR_Timers:BelowZero()
    --local cd = round(self.DataTimers[3][1],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Below Zero")),cd,nil) end
    self.DataTimers[3][1] = 60
end
-- 4: Deathbringer Saurfang
function MPR_Timers:RuneOfBlood()
    --local cd = round(self.DataTimers[4][1],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Rune of Blood")),cd,nil) end
    self.DataTimers[4][1] = 18
end
-- 5: Festergut
function MPR_Timers:GasSpore()
    --local cd = round(self.DataTimers[5][1],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Espora de gas")),cd,nil) end
    self.DataTimers[5][1] = 40
end
function MPR_Timers:GastricBloat()
    --local cd = round(self.DataTimers[5][2],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Hinchazón gástrica")),cd,nil) end
    self.DataTimers[5][2] = 15
end
-- 6: Rotface
function MPR_Timers:SlimeSpray()
    --local cd = round(self.DataTimers[6][1],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Pulverizador de babas")),cd,nil) end
    self.DataTimers[6][1] = 20
end
function MPR_Timers:MutatedInfection()
    --local cd = round(self.DataTimers[6][2],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Infección mutada")),cd,nil) end
    self.DataTimers[6][2] = 14
end
function MPR_Timers:VileGas()
    self.DataTimers[6][3] = 15
end
-- 7: Professor Putricide
MPR_Timers.PP_Phase = 1
function MPR_Timers:TearGas()
    self.PP_Phase = self.PP_Phase + 1
    self.DataTimers[7][1] = self.PP_Phase == 1 and (self.DataTimers[7][1] + 30)
    self.DataTimers[7][2] = self.PP_Phase == 1 and (self.DataTimers[7][2] + 30) or 21
    self.DataTimers[7][3] = self.PP_Phase == 1 and (self.DataTimers[7][3] + 30) or 35
end
function MPR_Timers:UnstableExperiment()
    --local cd = round(self.DataTimers[7][1],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Unstable Experiment")),cd,nil) end
    self.DataTimers[7][1] = 35
end
function MPR_Timers:MalleableGoo()
    --local cd = round(self.DataTimers[7][2],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Moco maleable")),cd,nil) end
    self.DataTimers[7][2] = 25
end
function MPR_Timers:ChokingGasBomb()
    --local cd = round(self.DataTimers[7][3],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Bomba de gas asfixiante")),cd,nil) end
    self.DataTimers[7][3] = 35
end
-- 8: Blood Prince Council
MPR_Timers.EmpoweredPrince = "Prince Valanar"
function MPR_Timers:InvocationOfBlood(Prince)
    self.EmpoweredPrince = Prince
    self.DataTimers[8][1] = 45
    --self.DataTimers[8][2] = nil
end
function MPR_Timers:ShockVortex()
    self.DataTimers[8][2] = 15
end
function MPR_Timers:EmpoweredShockVortex()
    --local cd = round(self.DataTimers[8][2],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Empowered Shock Vortex")),cd,nil) end
    self.DataTimers[8][2] = 15
end
function MPR_Timers:ShadowResonance()
    --local cd = round(self.DataTimers[8][3],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Shadow Resonance")),cd,nil) end
    self.DataTimers[8][3] = 11
end
-- 9: Blood-Queen Lana'thel
function MPR_Timers:InciteTerror()
    --local cd = round(self.DataTimers[9][1],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Incite Terror")),cd,nil) end
    self.DataTimers[9][1] = 100 + (self:Is25Man() and 0 or 20)
    self.DataTimers[9][2] = 30
end
function MPR_Timers:SwarmingShadows()
    self.DataTimers[9][2] = 30.5
end
-- 10: Valithria Dreamwalker
function MPR_Timers:SummonPortal()
    --local cd = round(self.DataTimers[10][1],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Summon Portal")),cd,nil) end
    self.DataTimers[10][1] = 45
end
-- 11: Sindragosa
MPR_Timers.SindragosaPhase = 1
function MPR_Timers:BlisteringCold()
    --local cd = round(self.DataTimers[11][1],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Blistering Cold")),cd,"Phase "..self.SindragosaPhase) end
    self.DataTimers[11][1] = SindragosaPhase == 2 and 31 or nil
end
function MPR_Timers:AirPhase()
    --local cd = round(self.DataTimers[11][2],1,true)
    --if cd > 0 then self:NewTimer("Air Phase",cd,nil) end
    self.DataTimers[11][1] = 60 --57
    self.DataTimers[11][2] = 108
end
function MPR_Timers:SecondPhase()
    self.SindragosaPhase = 2
    self.DataTimers[11][1] = 35
    self.DataTimers[11][2] = nil
    self.DataTimers[11][3] = 7
end
function MPR_Timers:FrostBeacon()
    if self.SindragosaPhase ~= 2 then return end
    --local cd = round(self.DataTimers[11][3],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Frost Beacon")),cd,nil) end
    self.DataTimers[11][3] = 16
end
-- 12: The Lich King 
function MPR_Timers:SummonShadowTrap()
    self.DataTimers[12][1] = 14
end
function MPR_Timers:SummonValkyr(GUID)
    self.ValkyrCount = self.ValkyrCount + 1
    if self.ValkyrCount == 1 then -- First Valkyr
        self.DataTimers[12][2] = 45
    end
    --self.ValkyrTable[GUID] = {}
    --self.ValkyrTable[GUID][1] = self.ValkyrCount
    if self.ValkyrCount == (self:Is10Man() and 1 or 3) then -- Last Valkyr
        self.ValkyrCount = 0
    end
end
function MPR_Timers:Defile()
    self.DataTimers[12][3] = 31
end
function MPR_Timers:HarvestSoul()
    self.DataTimers[12][4] = 75
end
function MPR_Timers:HarvestSouls()
    self.DataTimers[12][4] = 120
    self.DataTimers[12][3] = 50
end
function MPR_Timers:RemorselessWinter()
    self.DataTimers[12][1] = nil
    self.DataTimers[12][2] = nil
    self.DataTimers[12][3] = nil
    
    self.DataTimers[12][5] = self.QuakeCount == 0 and 3 or 5
    self.DataTimers[12][6] = 60
end
MPR_Timers.RagingSpiritCount = 0
function MPR_Timers:RagingSpiritSummoned()
    self.RagingSpiritCount = self.RagingSpiritCount + 1
    self.DataTimers[12][5] = self.RagingSpiritCount < 3 and 22 or nil
end
function MPR_Timers:Quake()
    --local cd = round(self.DataTimers[12][5],1,true)
    --if cd > 0 then self:NewTimer(GetSpellLink(self:GetSpellID("Quake")),cd,"Quake #"..(self.QuakeCount+1)) end
    self.DataTimers[12][5] = nil
    
    self.QuakeCount = self.QuakeCount + 1
    self.DataTimers[12][2] = self.QuakeCount == 1 and 26 or nil
    self.DataTimers[12][3] = self.QuakeCount == 1 and 44 or 32
    self.DataTimers[12][4] = self.QuakeCount == 2 and 20 or nil
    
    self.DataTimers[12][5] = nil
    self.DataTimers[12][6] = nil
    
    self.Label2:Show() -- Show Defile label
end
function MPR_Timers:FuryOfFrostmourne()
    self:Reset()
end
-- TRIAL OF THE CRUSADER
-- 13: Gormok the Impaler
function MPR_Timers:Impale() self.DataTimers[13][1] = 8 end
function MPR_Timers:StaggeringStomp() self.DataTimers[13][2] = 15 end
function MPR_Timers:RisingAnger() self.DataTimers[13][3] = 15 end
-- 14: Jormungar Twins
function MPR_Timers:SlimePool() self.DataTimers[14][1] = 30 end
-- 15:
-- 16:
-- 17:
-- 18:
-- 19:
-- RUBY SANCTUM
-- 20: Saviana Ragefire
function MPR_Timers:SavianaEnrage()
    self.DataTimers[20][1] = 45
end
function MPR_Timers:SavianaAirPhase()
    self.DataTimers[20][2] = 48
end
-- 21: Baltharus the Warborn
function MPR_Timers:BladeTempest(source)
    if not self.BaltharusObjects[source] then
        self.BaltharusCount = self.BaltharusCount + 1
        self.BaltharusObjects[source] = self.BaltharusCount
    end
    self.DataTimers[21][self.BaltharusObjects[source]] = 20
end
-- 22: General Zarithrian
function MPR_Timers:ZarithrianCleave()
    self.DataTimers[22][1] = 15
end
function MPR_Timers:ZarithrianSummonAdds()
    self.DataTimers[22][2] = 42
end
function MPR_Timers:ZarithrianIntimidatingRoar()
    self.DataTimers[22][3] = 42
end
-- 23: Halion
function MPR_Timers:MeteorStrike()
    self.DataTimers[23][1] = 40
end
function MPR_Timers:FieryCombustion()
    self.DataTimers[23][2] = 25
end
function MPR_Timers:PhaseTwo()
    self.DataTimers[23][1] = nil
    self.DataTimers[23][2] = nil
end
function MPR_Timers:TwilightCutter()
    self.DataTimers[23][3] = 25
end
function MPR_Timers:SoulConsumption()
    self.DataTimers[23][4] = 20
end

function MPR_Timers:EncounterEnd(ID)
    self:Reset()
end

function MPR_Timers:Reset()
    self.BossNum = nil
    MPR_Timers.Title2:SetText("|cFF00CCFF"..MPR.BossData[MPR_Timers.BossNum or 0]["ENCOUNTER"])
    
    for e,_ in pairs(MPR_Timers.DataTimers) do
        for i,_ in pairs(MPR_Timers.DataTimers[e]) do
            MPR_Timers.DataTimers[e][i] = nil
        end
    end
end

MPR_Timers_Updater = CreateFrame("frame", "MPR Timers (Updater)", UIParent)
MPR_Timers_Updater.Interval = 0.5
MPR_Timers_Updater.LastUpdate = 0
MPR_Timers_Updater:SetScript("OnUpdate", function(self, elapsed)
    if MPR.Settings["CCL_ONLOAD"] then CombatLogClearEntries() end
    if not MPR.Settings["TIMERS"] or GetZoneText() ~= "Icecrown Citadel" and GetMinimapZoneText() ~= "Frostmourne" and GetZoneText() ~= "Trial of the Crusader" and GetZoneText() ~= "The Ruby Sanctum" then
        MPR_Timers.Label3:SetText("")
        MPR_Timers.Label3:Hide()
        MPR_Timers.Label2:SetText("")
        MPR_Timers.Label2:Hide()
        MPR_Timers.Label1:SetText(not MPR.Settings["TIMERS"] and "Timer system is disabled." or "No timers active.")
        MPR_Timers:SetHeight(43)
        return
    end
    
    MPR_Timers_Updater.LastUpdate = MPR_Timers_Updater.LastUpdate + elapsed
    if MPR_Timers_Updater.LastUpdate < MPR_Timers_Updater.Interval then return end
    local diff = MPR_Timers_Updater.LastUpdate
    MPR_Timers_Updater.LastUpdate = 0
    
    local e = MPR_Timers.BossNum
    if e then
        MPR_Timers.DataTimers[e] = MPR_Timers.DataTimers[e] or {}
        if MPR_Timers.DataTimers[e] then
            for i=1,7 do
                if MPR_Timers.DataTimers[e][i] then
                    if MPR_Timers.DataTimers[e][i] and MPR_Timers.DataTimers[e][i] > 0 then
                        MPR_Timers.DataTimers[e][i] = MPR_Timers.DataTimers[e][i] - diff
                        if MPR_Timers.DataTimers[e][i] < 0 then 
                            MPR_Timers.DataTimers[e][i] = 0 
                            if e == 2 and i == 1 then
                                if MPR_Timers.LD_Phase == 2 and MPR_Timers:IsHeroic() and not MPR_Timers.AddsFound then
                                    if MPR_Timers:SearchForAdds() then
                                        MPR_Timers.AddsFound = true
                                        MPR_Timers:WaveSummoned()
                                    end
                                else
                                    MPR_Timers:WaveSummoned()
                                end
                            elseif e == 20 and i == 2 then
                                MPR_Timers:SavianaAirPhase()
                            end
                        end
                    end
                end
            end
        end
    end
    MPR_Timers:OnUpdate(diff)
end)

MPR_Timers_Options = CreateFrame("Frame", "MPR Timers (Options)")
function MPR_Timers_Options:Initialize()
    self:Hide()
    self:SetBackdrop(MPR.Settings["BACKDROP"])
    self:SetBackdropColor(unpack(MPR.Settings["BACKDROPCOLOR"]))
    self:SetBackdropBorderColor(MPR.Settings["BACKDROPBORDERCOLOR"].R/255, MPR.Settings["BACKDROPBORDERCOLOR"].G/255, MPR.Settings["BACKDROPBORDERCOLOR"].B/255)
    self:SetPoint("CENTER",UIParent)
    self:SetWidth(600)
    self:SetHeight(320)
    self:EnableMouse(true)
    self:SetMovable(true)
    self:RegisterForDrag("LeftButton")
    self:SetUserPlaced(true)
    self:SetScript("OnDragStart", function(self) self:StartMoving() end)
    self:SetScript("OnDragStop", function(self) self:StopMovingOrSizing() end)
    self:SetFrameStrata("FULLSCREEN_DIALOG")

    self.Title = self:CreateFontString(nil, "OVERLAY", "GameTooltipText")
    self.Title:SetPoint("TOP", 0, -8)
    self.Title:SetTextColor(190/255, 190/255, 190/255)
    self.Title:SetText("|cFF"..MPR.Colors["TITLE"].."MP Reporter|r - Timer options")
    self.Title:SetFont("Fonts\\FRIZQT__.TTF", 12, "OUTLINE")
    self.Title:SetShadowOffset(1, -1)

    self.CloseButton = CreateFrame("button","BtnClose", self, "UIPanelButtonTemplate")
    self.CloseButton:SetHeight(14)
    self.CloseButton:SetWidth(14)
    self.CloseButton:SetPoint("TOPRIGHT", -8, -8)
    self.CloseButton:SetText("x")
    self.CloseButton:SetScript("OnClick", function(self) MPR_Timers_Options:Hide() end)
    
    self:NewFS("Timer announcing:","FFFFFF",10,-16, 10)
    self:NewCB("S", "1E90FF", 102, -12, "T_SELF") -- [ ] Self
    self:NewCB("R", "EE7600", 132, -12, "T_RAID") -- [ ] Raid
    self:NewCB("C", "CCCCCC", 162, -12, "T_CABEZAZOS") -- [ ] Cabezazos
    
    --[[ Lord Marrowgar ]]--
    self:NewFS("Lord Marrowgar","00CCFF",10,-30,10)
    self:NewFS("{Cementerio de púas osarias}:","FFFFFF",14,-42,9)
    self:NewCB("5s", "FFFFFF", 144, -38, "1:1:5")
    self:NewCB("3s", "FFFFFF", 176, -38, "1:1:3")
    self:NewFS("{Tormenta ósea}:","FFFFFF",14,-54,9)
    self:NewCB("10s", "FFFFFF", 107, -50, "1:2:10")
    self:NewCB("5s", "FFFFFF", 144, -50, "1:2:5")
    self:NewCB("5s", "FFFFFF", 176, -50, "1:2:5")
    
    --[[ Lady Deathwhisper ]]--
    self:NewFS("Lady Deathwhisper","00CCFF",10,-68,10)
    self:NewFS("Nuevos adds:","FFFFFF",14,-80,9)
    self:NewCB("10s", "FFFFFF", 107, -76, "2:1:10")
    self:NewCB("5s", "FFFFFF", 144, -76, "2:1:5")
    self:NewCB("3s", "FFFFFF", 176, -76, "2:1:3")
    self:NewFS("{Invocar Sombra vengativa}:","FFFFFF",14,-92,9)
    self:NewCB("10s", "FFFFFF", 107, -88, "2:2:10")
    self:NewCB("5s", "FFFFFF", 144, -88, "2:2:5")
    self:NewCB("3s", "FFFFFF", 176, -88, "2:2:3")
    
    --[[ Gunship Battle ]]--
    self:NewFS("Gunship Battle","00CCFF",10,-108,10)
    self:NewFS("{Below Zero}:","FFFFFF",14,-120,9)
    self:NewCB("10s", "FFFFFF", 107, -116, "3:1:10")
    self:NewCB("5s", "FFFFFF", 144, -116, "3:1:5")
    self:NewCB("3s", "FFFFFF", 176, -116, "3:1:3")
    
    --[[ Deathbringer Saurfang ]]--
    self:NewFS("Deathbringer Saurfang","00CCFF",10,-136,10)
    self:NewFS("{Runa sangrienta}:","FFFFFF",14,-148,9)
    self:NewCB("10s", "FFFFFF", 107, -144, "4:1:10")
    self:NewCB("5s", "FFFFFF", 144, -144, "4:1:5")
    self:NewCB("3s", "FFFFFF", 176, -144, "4:1:3")
    
    --[[ Festergut ]]--
    self:NewFS("Festergut","00CCFF",10,-166,10)
    self:NewFS("{Espora de gas}:","FFFFFF",14,-178,9)
    self:NewCB("10s", "FFFFFF", 107, -174, "5:1:10")
    self:NewCB("5s", "FFFFFF", 144, -174, "5:1:5")
    self:NewCB("3s", "FFFFFF", 176, -174, "5:1:3")
    self:NewFS("{Hinchazón gástrica}:","FFFFFF",14,-190,9)
    self:NewCB("10s", "FFFFFF", 107, -186, "5:2:10")
    self:NewCB("5s", "FFFFFF", 144, -186, "5:2:5")
    self:NewCB("3s", "FFFFFF", 176, -186, "5:2:3")
    
    --[[ Rotface ]]--
    self:NewFS("Rotface","00CCFF",10,-206,10)
    self:NewFS("{Pulverizador de babas}:","FFFFFF",14,-218,9)
    self:NewCB("10s", "FFFFFF", 107, -214, "6:1:10")
    self:NewCB("5s", "FFFFFF", 144, -214, "6:1:5")
    self:NewCB("3s", "FFFFFF", 176, -214, "6:1:3")
    self:NewFS("{Infección mutada}:","FFFFFF",14,-230,9)
    self:NewCB("5s", "FFFFFF", 144, -226, "6:2:5")
    self:NewCB("3s", "FFFFFF", 176, -226, "6:2:3")
    self:NewFS("{Gas inmundo}:","FFFFFF",14,-242,9)
    self:NewCB("10s", "FFFFFF", 107, -238, "6:2:10")
    self:NewCB("5s", "FFFFFF", 144, -238, "6:2:5")
    self:NewCB("3s", "FFFFFF", 176, -238, "6:2:3")
    
    --[[ Professor Putricide ]]--
    self:NewFS("Professor Putricide","00CCFF",10,-258,10)
    self:NewFS("{Unstable Experiment}:","FFFFFF",14,-270,9)
    self:NewCB("10s", "FFFFFF", 144, -266, "7:1:10:7")
    self:NewCB("5s", "FFFFFF", 176, -266, "7:1:5:7")
    self:NewFS("{Moco maleable}:","FFFFFF",14,-282,9)
    self:NewCB("10s", "FFFFFF", 107, -278, "7:2:10:8")
    self:NewCB("5s", "FFFFFF", 144, -278, "7:2:5:8")
    self:NewCB("3s", "FFFFFF", 176, -278, "7:2:3:8")
    self:NewFS("{Bomba de gas asfixiante}:","FFFFFF",14,-294,9)
    self:NewCB("10s", "FFFFFF", 119, -290, "7:2:10:2")
    self:NewCB("5s", "FFFFFF", 153, -290, "7:2:5:2")
    self:NewCB("3s", "FFFFFF", 182, -290, "7:2:3:2")
    
    --[[ Blood Prince Council ]]--
    self:NewFS("Blood Prince Council","00CCFF", 210,-30,10)
    self:NewFS("Target Switch:","FFFFFF",214,-42,9)
    self:NewCB("10s", "FFFFFF", 336, -38, "8:1:10:3")
    self:NewCB("5s", "FFFFFF", 376, -38, "8:1:5:3")
    self:NewFS("{Empowered Shock Vortex}:","FFFFFF", 214,-54,9)
    self:NewCB("5s", "FFFFFF", 376, -50, "8:2:5")
    self:NewFS("{Shadow Resonance}:","FFFFFF", 214,-66,9)
    self:NewCB("5s", "FFFFFF", 376, -62, "8:2:5")
    
    --[[ Blood Queen Lana'thel ]]--
    self:NewFS("Blood Queen Lana'thel","00CCFF",210,-82,10)
    self:NewFS("{Incitar terror}:","FFFFFF",214,-94,9)
    self:NewCB("20s", "FFFFFF", 300, -90, "9:1:20:3")
    self:NewCB("10s", "FFFFFF", 338, -90, "9:1:10:3")
    self:NewCB("5s", "FFFFFF", 376, -90, "9:1:5:3")
    self:NewFS("{Sombras enjambradoras}:","FFFFFF",214,-106,9)
    self:NewCB("10s", "FFFFFF", 318, -102, "9:2:10:7")
    self:NewCB("5s", "FFFFFF", 352, -102, "9:2:5:7")
    self:NewCB("3s", "FFFFFF", 380, -102, "9:2:3:7")
    self:NewFS("{Rabia}:","FFFFFF",214,-118,9)
    self:NewCB("30s", "FFFFFF", 300, -114, "9:3:10:8")
    self:NewCB("20s", "FFFFFF", 338, -114, "9:3:5:8")
    self:NewCB("10s", "FFFFFF", 376, -114, "9:3:3:8")
      
    --[[ Valithria Dreamwalker ]]--
    self:NewFS("Valithria Dreamwalker","00CCFF",210,-134,10)
    self:NewFS("{Summon Portal}:","FFFFFF",214,-146,9)
    self:NewCB("10s", "FFFFFF", 338, -142, "10:1:10:3")
    self:NewCB("5s", "FFFFFF", 376, -142, "10:1:5:3")
    
    --[[ Sindragosa ]]--
    self:NewFS("Sindragosa","00CCFF",210,-162,10)
    self:NewFS("{Frío virulento}:","FFFFFF",214,-174,9)
    self:NewCB("10s", "FFFFFF", 306, -170, "11:1:10:8")
    self:NewCB("5s", "FFFFFF", 344, -170, "11:1:5:8")
    self:NewCB("3s", "FFFFFF", 376, -170, "11:1:3:8")
    self:NewFS("Fase aérea:","FFFFFF",214,-186,9)
    self:NewCB("10s", "FFFFFF", 306, -182, "11:2:10:6")
    self:NewCB("5s", "FFFFFF", 344, -182, "11:2:5:6")
    self:NewCB("3s", "FFFFFF", 376, -182, "11:2:3:6")
    self:NewFS("{Señal de Escarcha}:","FFFFFF",214,-198,9)
    self:NewCB("10s", "FFFFFF", 306, -194, "11:3:10:7")
    self:NewCB("5s", "FFFFFF", 344, -194, "11:3:5:7")
    self:NewCB("3s", "FFFFFF", 376, -194, "11:3:3:7")

    --[[ The Lich King ]]--
    self:NewFS("The Lich King","00CCFF",210,-214,10)
    self:NewFS("{Trampa de las Sombras}:","FFFFFF",214,-226,9)
    self:NewCB("5s", "FFFFFF", 290, -222, "12:1:5:8")
    self:NewCB("3s", "FFFFFF", 319, -222, "12:1:3:8")
    self:NewCB("2s", "FFFFFF", 349, -222, "12:1:2:8")
    self:NewCB("1s", "FFFFFF", 379, -222, "12:1:1:8")
    self:NewFS("{Invocar Val'kyr}:","FFFFFF",214,-238,9)
    self:NewCB("10s", "FFFFFF", 308, -234, "12:2:10:4")
    self:NewCB("5s", "FFFFFF", 345, -234, "12:2:5:4")
    self:NewCB("3s", "FFFFFF", 376, -234, "12:2:3:4")
    self:NewFS("{Profanar}:","FFFFFF",214,-250,9)
    self:NewCB("10s", "FFFFFF", 306, -246, "12:2:10:7")
    self:NewCB("5s", "FFFFFF", 344, -246, "12:2:5:7")
    self:NewCB("3s", "FFFFFF", 376, -246, "12:2:3:7")
    self:NewFS("{Recolectar alma/s}:","FFFFFF",214,-262,9)
    self:NewCB("10s", "FFFFFF", 306, -258, "12:2:10:6")
    self:NewCB("5s", "FFFFFF", 344, -258, "12:2:5:6")
    self:NewCB("3s", "FFFFFF", 376, -258, "12:2:3:6")
    self:NewFS("{Espíritu enfurecido}:","FFFFFF",214,-274,9)
    self:NewCB("10s", "FFFFFF", 306, -270, "12:2:10:4")
    self:NewCB("5s", "FFFFFF", 344, -270, "12:2:5:4")
    self:NewCB("3s", "FFFFFF", 376, -270, "12:2:3:4")
    self:NewFS("{Quake}:","FFFFFF",214,-286,9)
    self:NewCB("10s", "FFFFFF", 306, -282, "12:6:10:3")
    self:NewCB("5s", "FFFFFF", 344, -282, "12:6:5:3")
    self:NewCB("3s", "FFFFFF", 376, -282, "12:6:3:3")
    self:NewFS("{Peste necrótica}:","FFFFFF",214,-298,9)
    self:NewCB("10s", "FFFFFF", 306, -294, "12:7:10:4")
    self:NewCB("5s", "FFFFFF", 344, -294, "12:7:5:4")
    self:NewCB("3s", "FFFFFF", 376, -294, "12:7:3:4")
        
    --[[ Gormok the Impaler ]]--
    self:NewFS("Gormok the Impaler","3CAA50",410,-30,10)
    self:NewFS("{Impale}:","FFFFFF",414,-42,9)
    self:NewCB("10s", "FFFFFF", 490, -38, "13:1:10")
    self:NewCB("5s", "FFFFFF", 530, -38, "13:1:5")
    self:NewCB("3s", "FFFFFF", 560, -38, "13:1:3")
    self:NewFS("{Staggering Stomp}:","FFFFFF",414,-54,9)
    self:NewCB("5s", "FFFFFF", 530, -50, "13:1:5")
    self:NewCB("3s", "FFFFFF", 560, -50, "13:1:3")
    self:NewFS("{Rising Anger}:","FFFFFF",414,-66,9)
    self:NewCB("5s", "FFFFFF", 530, -62, "13:1:5")
    self:NewCB("3s", "FFFFFF", 560, -62, "13:1:3")
    
    --[[ Acidmaw & Dreadscale ]]--
    self:NewFS("Acidmaw & Dreadscale","3CAA50",410,-82,10)
    self:NewFS("{Slime Pool}:","FFFFFF",414,-94,9)
    self:NewCB("10s", "FFFFFF", 490, -90, "14:1:10")
    self:NewCB("5s", "FFFFFF", 530, -90, "14:1:5")
    self:NewCB("3s", "FFFFFF", 560, -90, "14:1:3")
    
    --[[ Saviana Ragefire ]]--
    self:NewFS("Saviana Ragefire","FF9912",410,-110,10)
    self:NewFS("{Enfurecer}:","FFFFFF",414,-122,9)
    self:NewCB("10s", "FFFFFF", 520, -118, "20:1:10")
    self:NewCB("5s", "FFFFFF", 560, -118, "20:1:5")
    self:NewFS("Fase aérea:","FFFFFF",414,-134,9)
    self:NewCB("10s", "FFFFFF", 520, -130, "20:2:10")
    self:NewCB("5s", "FFFFFF", 560, -130, "20:2:5")
    
    --[[ General Ragefire ]]--
    self:NewFS("Saviana Ragefire","FF9912",410,-110,10)
    self:NewFS("{Enfurecer}:","FFFFFF",414,-122,9)
    self:NewCB("10s", "FFFFFF", 520, -118, "20:1:10")
    self:NewCB("5s", "FFFFFF", 560, -118, "20:1:5")
    self:NewFS("Fase aérea:","FFFFFF",414,-134,9)
    self:NewCB("10s", "FFFFFF", 520, -130, "20:2:10")
    self:NewCB("5s", "FFFFFF", 560, -130, "20:2:5")
    
    --[[ Halion ]]--
    self:NewFS("Halion","FF9912",410,-150,10)
    self:NewFS("{Golpe de meteorito}:","FFFFFF",414,-162,9)
    self:NewCB("10s", "FFFFFF", 496, -158, "23:1:10:2")
    self:NewCB("5s", "FFFFFF", 532, -158, "23:1:5:2")
    self:NewCB("3s", "FFFFFF", 560, -158, "23:1:3:2")
    self:NewFS("{Combustión ígnea}:","FFFFFF",414,-174,9)
    self:NewCB("5s", "FFFFFF", 530, -170, "23:2:5:2")
    self:NewCB("3s", "FFFFFF", 560, -170, "23:2:3:2")
    self:NewFS("{Corte Crepuscular}:","FFFFFF",414,-186,9)
    self:NewCB("10s", "FFFFFF", 498, -182, "23:1:10:3")
    self:NewCB("5s", "FFFFFF", 532, -182, "23:1:5:3")
    self:NewCB("3s", "FFFFFF", 560, -182, "23:1:3:3")
    self:NewFS("{Consumo de alma}:","FFFFFF",414,-198,9)
    self:NewCB("5s", "FFFFFF", 530, -194, "23:1:5:3")
    self:NewCB("3s", "FFFFFF", 560, -194, "23:1:3:3")
end

function MPR_Timers_Options:Toggle()
    if MPR_Timers_Options:IsVisible() then
        MPR_Timers_Options:Hide()
    else
        MPR_Timers_Options:Show()
    end
end

function MPR_Timers_Options:NewFS(Text,Color,LocX,LocY,Size) -- Creates a fontstring
    local fontstring = MPR_Timers_Options:CreateFontString("Fontstring"..GetNewID(), "ARTWORK", "GameFontNormal")
    fontstring:SetPoint("TOPLEFT", LocX, LocY)
    if type(Color) ~= "string" then Color = "FFFFFF" end
    fontstring:SetTextColor(tonumber(Color:sub(1,2),16)/255, tonumber(Color:sub(3,4),16)/255, tonumber(Color:sub(5,6),16)/255)
    fontstring:SetFont("Fonts\\FRIZQT__.TTF", Size or 10, "OUTLINE")
    fontstring:SetText(Text:gsub("{(.-)}", function(a) return spell(MPR_Timers:GetSpellID(a), false, true) end))
end

function MPR_Timers_Options:NewCB(Text,Color,LocX,LocY,Var) -- Creates a checkbox
    local CheckBox = CreateFrame("CheckButton", "CheckBox"..GetNewID(), MPR_Timers_Options, "UICheckButtonTemplate")
    CheckBox:SetWidth(20)
    CheckBox:SetHeight(20)
    CheckBox:SetPoint("TOPLEFT", LocX, LocY)
    if type(Color) ~= "string" then Color = "FFFFFF" end
    if Var == "nil" then Color = "BEBEBE" end
    _G["CheckBox"..GetCurrentID().."Text"]:SetTextColor(tonumber(Color:sub(1,2),16)/255, tonumber(Color:sub(3,4),16)/255, tonumber(Color:sub(5,6),16)/255)
    _G["CheckBox"..GetCurrentID().."Text"]:SetFont("Fonts\\FRIZQT__.TTF", 9, "OUTLINE")
    _G["CheckBox"..GetCurrentID().."Text"]:SetText(Text)

    if type(Color) ~= "string" then Color = "FFFFFF" end
    
    if not Var or Var == "nil" then
        CheckBox:Disable()
    elseif not Var:find(":") then
        CheckBox:SetScript("OnShow",  function(self) CheckBox:SetChecked(MPR.Settings[Var]) end)
        CheckBox:SetScript("OnClick", function(self)
            MPR.Settings[Var] = not MPR.Settings[Var]
            if MPR.Settings[Var] and (Var == "T_RAID") then
                CheckRaidOptions(Var)
            end
        end)
    else
        CheckBox:SetScript("OnShow",  function(self)
            local e, i, s = strsplit(":", Var)
            if (MPR.Settings["TIMER_ANNOUNCES"][tonumber(e)] and MPR.Settings["TIMER_ANNOUNCES"][tonumber(e)][tonumber(i)]) then
                CheckBox:SetChecked(MPR.Settings["TIMER_ANNOUNCES"][tonumber(e)][tonumber(i)][tonumber(s)])
            end
        end)
        CheckBox:SetScript("OnClick", function(self)
            local e, i, s, t = strsplit(":", Var)
            MPR.Settings["TIMER_ANNOUNCES"][tonumber(e)] = MPR.Settings["TIMER_ANNOUNCES"][tonumber(e)] or {}
            MPR.Settings["TIMER_ANNOUNCES"][tonumber(e)][tonumber(i)] = MPR.Settings["TIMER_ANNOUNCES"][tonumber(e)][tonumber(i)] or {}
            MPR.Settings["TIMER_ANNOUNCES"][tonumber(e)][tonumber(i)][tonumber(s)] = CheckBox:GetChecked() and {false, tonumber(t) or 1} or nil
        end)
    end
end