# parameters in this order
#   0 - server instance target
#   1 - target database
#   2 - release artifact name/with path if needed
write-host "There are a total of $($args.count) arguments"
for ( $i = 0; $i -lt $args.count; $i++ ) {
    write-host "Argument  $i is $($args[$i])"
} 

$server=$args[0]
$db = $args[1]
$artifact = $args[2]

# set the target for the deployment artifact.
$prod = New-DatabaseConnection -ServerInstance $server -Database $db

# import the release artifact
$update = Import-DatabaseReleaseArtifact -Path $artifact

# deploy the artifact
Use-DatabaseReleaseArtifact $update -DeployTo $prod
