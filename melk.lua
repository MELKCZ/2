-- Skript pro zvýraznění hlav všech hráčů na serveru viditelných přes zdi

-- Funkce pro vytvoření highlight efektu
local function highlightHead(character)
    -- Najdeme hlavu hráče
    local head = character:FindFirstChild("Head")
    if head then
        -- Vytvoření nového Highlight objektu
        local highlight = Instance.new("Highlight")
        highlight.Name = "HeadHighlight"
        highlight.FillColor = Color3.new(1, 0, 0) -- Červená barva
        highlight.OutlineColor = Color3.new(1, 1, 1) -- Bílá barva
        highlight.DepthMode = Enum.HighlightDepthMode.Always -- Viditelnost přes zdi
        highlight.Adornee = head -- Zaměření zvýraznění na hlavu
        highlight.Parent = head -- Přidání do hlavy hráče
    end
end

-- Zvýraznění hlav všech aktuálních hráčů
for _, player in pairs(game.Players:GetPlayers()) do
    if player.Character then
        highlightHead(player.Character)
    end
    player.CharacterAdded:Connect(function(character)
        highlightHead(character)
    end)
end

-- Zvýraznění hlav hráčů, kteří se připojí později
game.Players.PlayerAdded:Connect(function(player)
    player.CharacterAdded:Connect(function(character)
        highlightHead(character)
    end)
end)
