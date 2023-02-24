

/// A module that creates the UGX coin.
module coins::ugx {
    use std::option;
    use sui::coin;
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of coin. The coin will have a type
    /// tag of kind: `Coin<package_object::mycoin::MYCOIN>`
    /// Make sure that the name of the type matches the module's name.
    struct UGX has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: UGX, ctx: &mut TxContext) {
        // let (treasury, metadata) = coin::create_currency( 
        //     witness: witness, 
        //     decimals: 6,
        //     symbol: b"UGX",
        //     name: b"Ugandan shilling",
        //     description: b"The shilling is the currency of Uganda. Officially divided into cents until 2013, due to substantial inflation the shilling now has no subdivision.",
        //     icon_url: option::none(),
        //     ctx: ctx
        //     );

        //  b"https://www.bou.or.ug/bou/export/sites/default/.gallery/Museum/Coins/Uga1000bird12-1.png_881579729.png",

        let (treasury, metadata) = coin::create_currency( 
            witness, 
            0,
            b"UGX",
            b"Ugandan shilling",
            b"The shilling is the currency of Uganda. Officially divided into cents until 2013, due to substantial inflation the shilling now has no subdivision.",
            option::none(),
            // "https://www.bou.or.ug/bou/export/sites/default/.gallery/Museum/Coins/Uga1000bird12-1.png_881579729.png",
            ctx
            );
        transfer::freeze_object(metadata);
        transfer::transfer(treasury, tx_context::sender(ctx))
    }

}