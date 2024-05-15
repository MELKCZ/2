-- Skript pro zvýraznění všech hráč

-- Funkce pro vytvoření highlight efektu
local function highlightPlayer(player)
    -- Získání modelu hráče (Character)
    local character = player.Character
    if character then
        -- Vytvoření nového Highlight objektu
        local highlight = Instance.new("Highlight")
        highlight.Name = "PlayerHighlight"
        highlight.FillColor = Color3.new(1, 0, 0) -- Červená barva
        highlight.OutlineColor = Color3.new(1, 1, 1) -- Bílá barva
        highlight.Parent = character -- Přidání do modelu hráče
    end
end

-- Přidání highlight efektu všem aktuálním hráčům
for _, player in pairs(game.Players:GetPlayers()) do
    highlightPlayer(player)
end

-- Přidání highlight efektu hráčům, kteří se připojí později
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        highlightPlayer(player)
    end)
end)
