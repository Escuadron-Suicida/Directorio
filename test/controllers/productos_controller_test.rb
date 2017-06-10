require 'test_helper'

class ProductosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @producto = productos(:one)
  end

  test "should get index" do
    get productos_url
    assert_response :success
  end

  test "should get new" do
    get new_producto_url
    assert_response :success
  end

  test "should create producto" do
    assert_difference('Producto.count') do
      post productos_url, params: { producto: { business_id: @producto.business_id, categoria: @producto.categoria, descripcion: @producto.descripcion, nombre: @producto.nombre, precio_compra: @producto.precio_compra, precio_venta: @producto.precio_venta, stock: @producto.stock } }
    end

    assert_redirected_to producto_url(Producto.last)
  end

  test "should show producto" do
    get producto_url(@producto)
    assert_response :success
  end

  test "should get edit" do
    get edit_producto_url(@producto)
    assert_response :success
  end

  test "should update producto" do
    patch producto_url(@producto), params: { producto: { business_id: @producto.business_id, categoria: @producto.categoria, descripcion: @producto.descripcion, nombre: @producto.nombre, precio_compra: @producto.precio_compra, precio_venta: @producto.precio_venta, stock: @producto.stock } }
    assert_redirected_to producto_url(@producto)
  end

  test "should destroy producto" do
    assert_difference('Producto.count', -1) do
      delete producto_url(@producto)
    end

    assert_redirected_to productos_url
  end
end