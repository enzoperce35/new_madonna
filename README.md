database: PostgreSql
app link: https://madonna-pos.herokuapp.com/

Important:
  Needed a scope which neatly says the instance on search is from the user's current branch e.g. product.from_branch.where(id: 111)

User username:string, branch:string

InventoryItem branch:string  name:string type:string(ingredients, packagings) unit:string margin:float stock:float
  has_many: orders, dependent: destroy
  has_many: products, through: orders 

Product branch:string name:string category:string price:float default:0 soft_deleted:boolean
  has_many: orders, dependent: destroy
  has_many: inventory_items,through: orders
  belongs_to: sale

Order(Joiner Model) branch:string
  belongs_to: inventory_item, optional: true
  belongs_to: product, optional: true

Sale(creates tickets that is available for 40 days) sale_number:integer editor:string
  has_many: products

Record branch:string date:timestamp total:float

APP TASKS:
*User Branch Switching
  *A scope will filter user roles(principal, admin, maintenance)
    *user in default has no role and can only access index page
    *principal role have access to every branch(no access by default and to be designated using app utilities)
    *admin role have access to one designated branch(to be designated by principal users)
    *maintenance have access to every branch and app utilities
*Ticket Production
  1.User clicks on the sale link named as a sale number e.g. "sale #1)
  2.a = Product.from_branch.sale.where(created: today, sale_number: 1)
  3.variable 'a' now contains the sale and it's products
  4.if total sale is not obtained because deleted, get it's total through Records.
*InventoryItem reduction
  1.customer orders products e.g. 3x burger, 2x fries
  2.Sale creates sale_id and is induced 3 times to burger and 2 times to fries in Product row as a foreign key
  3.A method would be called to deduct stock form inventory items through Order
    1.search the products through it's sale_id ~ products = Products.from_branch.where(sale_id = 111)
    2.loop through products and search on Orders to get joined values of Product and InventoryItem
    3.deduct stock from inventory item while on loop
    4.same procedure will be used in an instance the sale would be cancelled, just do addition instead of deduction while on loop
*Automatic Deletion
  *5 Sale instances will be deleted if sale count is 40 above(A Record will be created before each deletion)
    *if sale includes soft deleted product, destroy the product first
  *Record count limit is 500
*Manual Deletion
  *On Maintenance exclusive page, these infos would be shown:
    *Products and InventoryItems that is updated is last 3 months
    *delete button for each
   
