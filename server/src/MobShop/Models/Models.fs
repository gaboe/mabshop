namespace MobShop.Models

[<CLIMutable>]
type Product =
    {
        ID: int;
        Name: string;
        Price: decimal;
        SmallDescription: string;
        LongDescription: string;
        ImageUrl: string;
    }