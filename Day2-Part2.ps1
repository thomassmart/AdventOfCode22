$InputFile = "Day2-Input.csv"
$Games = Get-Content $InputFile | ConvertFrom-Csv

$OpponentMap = @{
    'A' = 'Rock'
    'B' = 'Paper'
    'C' = 'Scissors'
}

$StrategyMap = @{
    'X' = 'Lose'
    'Y' = 'Draw'
    'Z' = 'Win'
}

$PointMap = @{
    'Paper' = 2
    'Rock' = 1
    'Scissors' = 3
}
$TotalPoints = 0
ForEach($Play in $Games){
    $Choice = $Null
    $RoundPoints = 0
    $Opponent = $OpponentMap."$($Play.opponent)"
    $Strategy = $StrategyMap."$($Play.Strategy)"
    Switch ($Strategy){
        "Win"
        {
            Switch ($Opponent) {
                "Rock" {$Choice = "Paper"}
                "Paper" {$Choice = "Scissors"}
                "Scissors" {$Choice = "Rock"}
            }
        }
        "Draw"
        {
            Switch ($Opponent) {
                "Rock" {$Choice = "Rock"}
                "Paper" {$Choice = "Paper"}
                "Scissors" {$Choice = "Scissors"}
            }
        }
        "Lose"
        {
            Switch ($Opponent) {
                "Rock" {$Choice = "Scissors"}
                "Paper" {$Choice = "Rock"}
                "Scissors" {$Choice = "Paper"}
            }
        }
    }
    $RoundPoints += $PointMap."$($Choice)"
    switch ($Strategy) {
        "Win" {$RoundPoints += 6}
        "Draw" {$RoundPoints += 3}
    }
    Write-Host "$Strategy :: $Opponent vs $Choice :: Total Points $RoundPoints"
    $TotalPoints += $RoundPoints
}
Write-Host "🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️🪨📄✂️"
Write-Host "Total Points = $TotalPoints"