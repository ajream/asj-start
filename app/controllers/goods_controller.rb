class GoodsController < ApplicationController
  before_action :set_good, only: [:show, :edit, :update, :destroy]

  # GET /goods
  # GET /goods.json
  def index
    @goods = Good.page(params[:page] || 1).per(params[:per_page] || 15).order("created_at DESC")
  end

  # GET /goods/1
  # GET /goods/1.json
  def show
  end

  # GET /goods/new
  def new
    @good = current_user.goods.new
  end

  # GET /goods/1/edit
  def edit
  end

  # POST /goods
  # POST /goods.json
  def create
    @good = current_user.goods.new(good_params)

    respond_to do |format|
      if @good.save
        format.html { redirect_to @good, notice: 'Good was successfully created.' }
        format.json { render :show, status: :created, location: @good }
      else
        format.html { render :new }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /goods/1
  # PATCH/PUT /goods/1.json
  def update
    respond_to do |format|
      if @good.update(good_params.merge(staff_id: current_user.id))
        format.html { redirect_to @good, notice: 'Good was successfully updated.' }
        format.json { render :show, status: :ok, location: @good }
      else
        format.html { render :edit }
        format.json { render json: @good.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /goods/1
  # DELETE /goods/1.json
  def destroy
    @good.destroy
    respond_to do |format|
      format.html { redirect_to goods_url, notice: 'Good was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_good
      @good = Good.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def good_params
      params.require(:good).permit(:staff_id, :remark, :price)
    end
end
