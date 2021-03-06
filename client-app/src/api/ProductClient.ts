import { IdentityClient } from '../generated/Identity/identity_pb_service';
import { CreateRequest, ListRequest, ListReply } from '../generated/Product/product_pb';
import { Product, ProductClient } from '../generated/Product/product_pb_service';
import { grpc } from "@improbable-eng/grpc-web";

var apiUrl = process.env.REACT_APP_API_GATEWAY;
var apiIdentityUrl = process.env.REACT_APP_API_IDENTITY;

var client = new ProductClient(apiUrl!)
var Idclient = new IdentityClient(apiIdentityUrl!)

export const createCommand = (name: string) => {
    var request = new CreateRequest();
    request.setName(name);

    client.create(request, (err, response) => {
        if (response) {
            console.log(response.getId())
        }
        if (err) {
            console.log(err);
        }
    });
}


export const listCommand = (token: string): Promise<ListReply> => {

    var listRequest = new ListRequest();
    return new Promise((resolve, reject) => {
        grpc.invoke(Product.List, {
            request: listRequest,
            metadata: new grpc.Metadata({ 'Authorization': token }),
            host: apiUrl!,
            onMessage: (message: ListReply) => {
                resolve(message)
            },
            onEnd: (code: grpc.Code, msg: string | undefined, trailers: grpc.Metadata) => {
                if (code == grpc.Code.OK) {
                    console.log("all ok")
                } else {
                    return reject(msg);
                }
            },

        })
    })
}
