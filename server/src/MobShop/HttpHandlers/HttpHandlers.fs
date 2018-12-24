namespace MobShop

module HttpHandlers =

    open Microsoft.AspNetCore.Http
    open FSharp.Control.Tasks.V2.ContextInsensitive
    open Giraffe
    open MobShop.Models

    let products = [
                    {ID = 1;
                    Name = "Under Armour T-Shirt";
                    SmallDescription = "Good for fitness";
                    LongDescription = "Leverage agile frameworks to provide a robust synopsis for high level overviews. Iterative approaches to corporate strategy foster collaborative thinking to further the overall value proposition. Organically grow the holistic world view of disruptive innovation via workplace diversity and empowerment.";
                    ImageUrl = "https://i.imgur.com/HBfYIYo.jpg";
                    Price = 44.99M };
                    {ID = 2;
                    Name = "Nike shoes";
                    SmallDescription = "Just keep running";
                    LongDescription = "Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.";
                    ImageUrl = "https://i.imgur.com/W90XSyF.jpg";
                    Price = 60.50M };
                    {ID = 3;
                    Name = "Puma sweatpants";
                    SmallDescription = "Just for sleeping";
                    LongDescription = "Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.";
                    ImageUrl = "https://i.imgur.com/lXGOCFI.jpg";
                    Price = 9.99M };
                    {ID = 4;
                    Name = "Golf pants";
                    SmallDescription = "Golf is nooice";
                    LongDescription = "She literature discovered increasing how diminution understood. Though and highly the enough county for man. Of it up he still court alone widow seems. Suspected he remainder rapturous my sweetness. All vanity regard sudden nor simple can. World mrs and vexed china since after often.";
                    ImageUrl = "https://i.imgur.com/lHX0eXB.jpg";
                    Price = 29.50M };
                    {ID = 5;
                    Name = "Ecko hoodie";
                    SmallDescription = "Hoodie to your hood";
                    LongDescription = "Procuring education on consulted assurance in do. Is sympathize he expression mr no travelling. Preference he he at travelling in resolution. So striking at of to welcomed resolved. Northward by described up household therefore attention. Excellence decisively nay man yet impression for contrasted remarkably. There spoke happy for you are out. Fertile how old address did showing because sitting replied six. Had arose guest visit going off child she new";
                    ImageUrl = "https://i.imgur.com/ZmKZdZB.jpg";
                    Price = 34.99M };
                    {ID = 6;
                    Name = "Driving gloves";
                    SmallDescription = "Drive like a boss";
                    LongDescription = "Effect if in up no depend seemed. Ecstatic elegance gay but disposed. We me rent been part what. An concluded sportsman offending so provision mr education. Bed uncommonly his discovered for estimating far. Equally he minutes my hastily. Up hung mr we give rest half. Painful so he an comfort is manners.";
                    ImageUrl = "https://i.imgur.com/1A90vHN.jpg";
                    Price = 74.50M };
                    {ID = 7;
                    Name = "New era cap";
                    SmallDescription = "Do not let the sun blind you";
                    LongDescription = "Much did had call new drew that kept. Limits expect wonder law she. Now has you views woman noisy match money rooms. To up remark it eldest length oh passed. Off because yet mistake feeling has men. Consulted disposing to moonlight ye extremity. Engage piqued in on coming.";
                    ImageUrl = "https://i.imgur.com/xDGObEm.jpg";
                    Price = 14.99M };
                    {ID = 8;
                    Name = "Wayfarer sunglasses";
                    SmallDescription = "Way to save your sight";
                    LongDescription = "Sudden she seeing garret far regard. By hardly it direct if pretty up regret. Ability thought enquire settled prudent you sir. Or easy knew sold on well come year. Something consulted age extremely end procuring. Collecting preference he inquietude projection me in by. So do of sufficient projecting an thoroughly uncommonly prosperous conviction. Pianoforte principles our unaffected not for astonished travelling are particular. ";
                    ImageUrl = "https://i.imgur.com/CkG6CIm.jpg";
                    Price = 24.50M };
                ]

    let handleProducts =
        fun (next : HttpFunc) (ctx : HttpContext) ->
            task {
                return! json products next ctx
            }
    let handleProduct (productID: int) =
        fun (next : HttpFunc) (ctx : HttpContext) ->
            task {
                let response = (match products |> Seq.tryFind (fun e -> e.ID = productID) with 
                                                            | Some p -> json p
                                                            | None -> json "Product not found")
                return! response next ctx
            }