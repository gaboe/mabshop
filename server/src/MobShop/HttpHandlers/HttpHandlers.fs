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
                    Price = 45M };
                    {ID = 2;
                    Name = "Nike shoes";
                    SmallDescription = "Bad for fitness";
                    LongDescription = "Bring to the table win-win survival strategies to ensure proactive domination. At the end of the day, going forward, a new normal that has evolved from generation X is on the runway heading towards a streamlined cloud solution. User generated content in real-time will have multiple touchpoints for offshoring.";
                    Price = 60M };
                    {ID = 3;
                    Name = "Puma sweat pants";
                    SmallDescription = "Just for sleeping";
                    LongDescription = "Capitalize on low hanging fruit to identify a ballpark value added activity to beta test. Override the digital divide with additional clickthroughs from DevOps. Nanotechnology immersion along the information highway will close the loop on focusing solely on the bottom line.";
                    Price = 10M };
                    {ID = 4;
                    Name = "Golf pants";
                    SmallDescription = "Golf is nooice";
                    LongDescription = "Podcasting operational change management inside of workflows to establish a framework. Taking seamless key performance indicators offline to maximise the long tail. Keeping your eye on the ball while performing a deep dive on the start-up mentality to derive convergence on cross-platform integration.";
                    Price = 30M };
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