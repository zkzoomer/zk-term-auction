// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract IZKTermAuction {
    error InsufficientCollateral();
    error InsufficientPurchaseTokens();

    /// @dev Used to store the parameters of an auction.
    /// @param purchaseToken Purchase token address
    /// @param purchasePrice Oracle price of the purchase token at proof verification time
    /// @param collateralToken Collateral token address
    /// @param collateralPrice Oracle price of the collateral token at proof verification time
    /// @param dayCount Number of days between auction and maturity dates, used to compute servicing fees and repurchase prices
    struct AuctionParameters {
        address purchaseToken;
        uint256 purchasePrice;
        address collateralToken;
        uint256 collateralPrice;
        uint256 dayCount;
    }

    /// @dev The public values encoded as a struct that can be easily deserialized inside Solidity.
    /// @param proverAddress Address of the prover
    /// @param accBidsHash Reconstructed hash chain of all bids placed and revealed onchain
    /// @param accOffersHash Reconstructed hash chain of all offers placed and revealed onchain
    /// @param auctionParametersHash Hash commitment containing information of the tokens involved
    /// @param auctionResultRoot The root of the auction results tree
    struct PublicValuesStruct {
        address proverAddress;
        bytes32 accBidsHash;
        bytes32 accOffersHash;
        bytes32 auctionParametersHash;
        bytes32 auctionResultRoot;
    }
}