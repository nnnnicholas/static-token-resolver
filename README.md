# ipfs-token-resolver
Lets project creators set any string as the uri (e.g., IPFS or HTTPS) for their Juicebox Project.

This repo contains a Juicebox Custom Token Resolver registry. Juicebox project owners can set this contract (already deployed on mainnet) as the custom resolver for their project. They can then set the string they'd like to use as the URI for their project's token on this contract. This contract makes it as easy as sending these two small txs to set an IPFS or HTTPS URI for your project's metadata. Without this contract, project owners who want to set their project's NFT metadata to a string URI would have to deploy their own custom token resolver contract, which is more expensive and more work.

## Before you start
1. Install [Foundry](https://book.getfoundry.sh/getting-started/installation).
2. Install [Yarn Classic](https://classic.yarnpkg.com/en/docs/install#mac-stable). 

## Usage of the deployed contract on Mainnet
1. Set the IPFS Resolver as the token resolver for *your* project.
2. Set the string you'd like to use for your project. This string will be used as the URI for your project's token.

## Usage of this repo 
1. Install dependencies with `forge install && yarn install`
2. Deploy with `forge script script/Deploy.s.sol`. You'll have to pass a private key or use a wallet, too. [See the Foundry Book](https://book.getfoundry.sh/reference/forge/forge-script#wallet-options---raw) for details on deploying with different types of private keys.
3. Set the newly deployed contract as the resolver for your project. Send a `setTokenUriResolverForProject(uint256 _projectId, IJBTokenUriResolver _resolver)` transaction to the the [JB Token Resolver](https://docs.juicebox.money/dev/extensions/juice-token-resolver/tokenuriresolver/#settokenuriresolverforproject), passing your new contract's address as the argument. You can use [Etherscan](https://etherscan.io/address/0x2c39bb41e2af6bec6c3bb102c07c15eda648a366#writeContract#F3) or [Etherfunk](https://etherfunk.io/address/0x2c39bb41e2af6bec6c3bb102c07c15eda648a366?fn=setTokenUriResolverForProject) to send this tx.

Note: `foundry.toml`'s allows Forge to find libs in `/node_modules` without an explicit remapping. For this reason there is no remappings.txt needed. 

## Other resources
- [JB Token Resolver docs](https://docs.juicebox.money/dev/extensions/juice-token-resolver/tokenuriresolver/)
- [Template](https://github.com/nnnnicholas/juice-token-resolver-template) for creating your own Token Resolver
- [Template](https://github.com/nnnnicholas/juice-svg-template) for creating onchain SVGs based on Juicebox data