#
 # Administrator products controller.
 #
 # @author:
 #
 # @version: 1.1
 # @notes: - Added way of showing all with multiple published status
 #         - Allow the admin order the rows by clicking the header
 #         - !!** Implement button functionality, so we can 'bulk archive' selected products
#

class Administration::ProductsController < Administration::AdministrationController
  # GET /products
  # GET /products.json
  def index
    sort = params[:sort]
    
    # Initialize @products with all the producs availables
    @products = Product.find(:all)
    
    # Order @products by selected choice
    case sort
      when 'name'
        @products, @name_class = Product.find(:all), 'hilite'
      when 'status'
        @products, @published_status_class = Product.order(:published_status), 'hilite'
      when 'subcode'
        @products = Product.order(:subcode)
    end
    
    # Format the code depending if it's html or json
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @products }
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @product = Product.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/new
  # GET /products/new.json
  def new
    @product = Product.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product }
    end
  end

  # GET /products/1/edit
  def edit
    @product = Product.find(params[:id])
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(params[:product])

    respond_to do |format|
      if @product.save
        format.html { redirect_to administration_product_path(@product), notice: 'Product was successfully created.' }
        format.json { render json: @product, status: :created, location: @product }
      else
        format.html { render action: "new" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /products/1
  # PUT /products/1.json
  def update
    @product = Product.find(params[:id])

    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end
end
