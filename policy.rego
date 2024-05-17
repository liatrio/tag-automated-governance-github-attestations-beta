package attestation.slsa1
import future.keywords.if

approved_repos := [
    "https://github.com/liatrio/tag-automated-governance-github-attestations-beta"
]

approved_org := [
    "https://github.com/liatrio"
]

# Fail closed
default allow := false

# Allow if the repository is in the approved_repos list and the predicateType matches
allow {
    some i
    # Check if the predicateType matches the required type
    input[i].verificationResult.statement.predicateType == "https://slsa.dev/provenance/v1"

    # Attempt to safely assign the repo and org variables
    repo := input[i].verificationResult.statement.predicate.buildDefinition.externalParameters.workflow.repository
    org := input[i].verificationResult.verifiedIdentity.sourceRepositoryOwnerURI

    repo == approved_repos[_]
    org == approved_org[_]
}