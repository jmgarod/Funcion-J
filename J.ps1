$a=(1..10) | % { Get-Random -Minimum 1 -Maximum 100 }
$b=(1..10) | % { Get-Random -Minimum 1 -Maximum 100 }
$x=5

function J{
    param(
        [Parameter(Mandatory=$true, Position=0)]
         [int[]]$a,
         [Parameter(Mandatory=$true, Position=1)]
         [int[]]$b,
         [Parameter(Mandatory=$true, Position=2)]
        [int]$x
    )
    return ($a | % { [Math]::pow([Math]::sqrt(($b | % { [Math]::Sqrt([Math]::pow($x,2)+$_)/[Math]::PI } | Measure-Object -sum).sum)/[Math]::pow(3*[Math]::pow([Math]::PI,2)*[Math]::Sin([Math]::pi/4)+1,3)+1,[Math]::pow($_,2)) } | measure-object -sum).sum/$a.Length
}

J $a $b $x