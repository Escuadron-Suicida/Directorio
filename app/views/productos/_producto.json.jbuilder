json.extract! producto, :id, :nombre, :stock, :descripcion, :categoria, :precio_compra, :precio_venta, :business_id, :created_at, :updated_at
json.url producto_url(producto, format: :json)
