-- Skript pro zvýraznění všech hráčů na serveru viditelných přes zdi

-- Funkce pro vytvoření highlight efektu
local function highlightPlayer(character)
    -- Vytvoření nového Highlight objektu
    local highlight = Instance.new("Highlight")
    highlight.Name = "PlayerHighlight"
    highlight.FillColor = Color3.new(1, 0, 0) -- Červená barva
    highlight.OutlineColor = Color3.new(1, 1, 1) -- Bílá barva
    highlight.DepthMode = Enum.HighlightDepthMode.Always -- Viditelnost přes zdi
    highlight.Parent = character -- Přidání do modelu hráče
end

-- Zvýraznění všech aktuálních hráčů
for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character then
        highlightPlayer(player.Character)
    end
    player.CharacterAdded:Connect(function(character)
        highlightPlayer(character)
    end)
end

-- Zvýraznění hráčů, kteří se připojí později
game.Players.PlayerAdded:Connect(function(player)
    p

