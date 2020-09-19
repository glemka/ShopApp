$protoc = $PSScriptRoot + '.\protoc-3.13.0-win64\protoc.exe'
$arguments = "--plugin=protoc-gen-ts=..\client-app\node_modules\.bin\protoc-gen-ts.cmd ";
$arguments +="--js_out=import_style=commonjs,binary:..\client-app\src\generated\Product ";
$arguments +="--ts_out=service=grpc-web:..\client-app\src\generated\Product "
$arguments +="-I ..\ShopApp.Shared\src\ShopApp.Shared\Protos ..\ShopApp.Shared\src\ShopApp.Shared\Protos\product.proto"
Start-Process $protoc -ArgumentList $arguments  -NoNewWindow

$arguments = "--plugin=protoc-gen-ts=..\client-app\node_modules\.bin\protoc-gen-ts.cmd ";
$arguments +="--js_out=import_style=commonjs,binary:..\client-app\src\generated\Identity ";
$arguments +="--ts_out=service=grpc-web:..\client-app\src\generated\Identity "
$arguments +="-I ..\ShopApp.Shared\src\ShopApp.Shared\Protos ..\ShopApp.Shared\src\ShopApp.Shared\Protos\identity.proto"
Start-Process $protoc -ArgumentList $arguments -NoNewWindow

$arguments = "--plugin=protoc-gen-ts=..\client-app\node_modules\.bin\protoc-gen-ts.cmd ";
$arguments +="--js_out=import_style=commonjs,binary:..\client-app\src\generated\Order ";
$arguments +="--ts_out=service=grpc-web:..\client-app\src\generated\Order "
$arguments +="-I ..\ShopApp.Shared\src\ShopApp.Shared\Protos ..\ShopApp.Shared\src\ShopApp.Shared\Protos\order.proto"
Start-Process $protoc -ArgumentList $arguments -NoNewWindow

