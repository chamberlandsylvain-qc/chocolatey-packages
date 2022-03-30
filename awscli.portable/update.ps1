# met à jour le paquet awscli.portable
import-module au

function global:au_GetLatest {
  $version = (Invoke-RestMethod -Uri "https://api.github.com/repos/aws/aws-cli/tags")[0].name
  $url = "https://awscli.amazonaws.com/AWSCLIV2-$version.msi"
  return @{ Version = $version; URL32 = $url }
}

function global:au_SearchReplace {
  @{ }
}

update -ChecksumFor 32