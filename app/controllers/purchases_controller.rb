class PurchasesController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: :index

  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @purchaseform = PurchaseForm.new

    # ログインしており、かつ自身が出品した商品の場合、トップページにリダイレクト
    if user_signed_in? && @item.present? && current_user.id == @item.user_id
      redirect_to root_path
      return
    end

    # ログインしており、かつ商品が売却済みの場合、トップページにリダイレクト
    return unless user_signed_in? && @item.present? && @item.purchase.present?

    redirect_to root_path
  end

  def create
    @purchaseform = PurchaseForm.new(purchase_params)
    if @purchaseform.valid?
      pay_item
      @purchaseform.save(item_id: @item.id, user_id: current_user.id)
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @purchaseform.price || @item.price,  # 商品の値段
      card: @purchaseform.token,                   # カードトークン
      currency: 'jpy'                              # 通貨の種類（日本円）
    )
  end

  def purchase_params
    params.require(:purchase_form).permit(:post_code, :region_id, :municipality, :house_number, :building_name, :phone_number).merge(
      token: params[:token], price: @item.price
    )
  end
end
