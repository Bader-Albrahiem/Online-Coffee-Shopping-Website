using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace OnlineCoffeeShopping.Models
{
    public class ShoppingCart
    {
        #region Properties

        public List<CartItem> Items { get; private set; }
        public List<OrderDeatils> OrderList { get; private set; }

        #endregion
        #region Singleton Implementation
   
        public static readonly ShoppingCart Instance;
       
    
        static ShoppingCart()
        {
         
            if (HttpContext.Current.Session["ASPNETShoppingCart"] == null)
            {
                Instance = new ShoppingCart();
                Instance.Items = new List<CartItem>();
                HttpContext.Current.Session["ASPNETShoppingCart"] = Instance;
            }
            else
            {
                Instance = (ShoppingCart)HttpContext.Current.Session["ASPNETShoppingCart"];
            }
        }
 
        protected ShoppingCart() { }
        #endregion
        #region Item Modification Methods
 
        public void AddItem(int productId, int quan)
        {
         
            CartItem newItem = new CartItem(productId);
           
            if (Items.Contains(newItem))
            {
                foreach (CartItem item in Items)
                {
                    if (item.Equals(newItem))
                    {
                        item.Quantity +=quan;
                        return;
                    }
                }
            }
            else
            {
                newItem.Quantity = quan;
                Items.Add(newItem);
            }
        }
     
        public void SetItemQuantity(int productId, int quantity)
        {
     
            if (quantity == 0)
            {
                RemoveItem(productId);
                return;
            }
 
            CartItem updatedItem = new CartItem(productId);
            foreach (CartItem item in Items)
            {
                if (item.Equals(updatedItem))
                {
                    item.Quantity = quantity;
                    return;
                }
            }
        }
       
     
       
        public void AddOrder(string name, string phone, string country,string city ,string zipCode , string address)
        {
            OrderDeatils ord = new OrderDeatils();
            ord.Name = name;
            ord.Phone_Number= phone;
            ord.Address = address;
            ord.ZipCode = zipCode;
            ord.City = city;
            ord.Country= country;
            Instance.OrderList = new List<OrderDeatils>();
            OrderList.Add(ord);
        }
        public void RemoveItem(int productId)
        {
            CartItem removedItem = new CartItem(productId);
            Items.Remove(removedItem);
        }
        #endregion
        #region Reporting Methods

        public decimal GetSubTotal()
        {
            decimal subTotal = 0;
            foreach (CartItem item in Items)
                subTotal += item.TotalPrice;
            return subTotal;
        }
        public decimal Tax()
        {
            return GetSubTotal() * Convert.ToDecimal(0.07);
        }
        public decimal Shipping()
        {
            return GetSubTotal() * Convert.ToDecimal(0.10);
        }
        public decimal USDtotal()
        {
            decimal total = (GetSubTotal() + (Shipping() + Tax())) / Convert.ToDecimal(3.75);
            return total ;
        }
        #endregion
    }
}