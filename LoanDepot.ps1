$MyInputString = "abcdedcba"
$MyDupsAsArray = $MyInputString.ToCharArray() | Group-Object -NoElement | Where count -gt 1 
$checker = 0
$ThisChar = ""

foreach ($dups in $MyDupsAsArray)
{
    $firstone = $MyInputString.IndexOf($dups.Name)
    $ModString = $MyInputString.Substring($firstone + 1)

    $secondone = $ModString.IndexOf($dups.Name) + $firstone + 1
    if($checker -eq 0)
    {
        $checker = $secondone
        $ThisChar = $dups.Name
    }
    elseif ($checker -gt $secondone)
    {
        $checker = $secondone
        $ThisChar = $dups.Name
    }
}

write-host "The first character that is a duplicate is: " $ThisChar

