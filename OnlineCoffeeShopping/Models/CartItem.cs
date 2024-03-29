﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace OnlineCoffeeShopping.Models
{
    public class CartItem : IEquatable<CartItem>
    {
        #region Properties
    
        public int Quantity { get; set; }
        private int _productId;
        public int ProductId
        {
            get { return _productId; }
            set
            {
          
                _product = null;
                _productId = value;
            }
        }
        private Product _product = null;
        public Product Prod
        {
            get
            {
          
                if (_product == null)
                {
                    _product = new Product(ProductId);
                }
                return _product;
            }
        }
        public string ProductName
        {
            get { return Prod.ProductName; }
        }
        public string ProductImg
        {
            get { return Prod.imgPath; } 
        }
        public string CompanyName
        {
            get { return Prod.CompanyName; }
        }
        public string Product_Weight
        {
            get { return Prod.Product_Weight; }
        }
        public decimal UnitPrice
        {
            get { return Prod.Price; }
        }
        public decimal TotalPrice
        {
            get { return UnitPrice * Quantity; }
        }
        public decimal USDprice
        {
            get { return (TotalPrice + Tax() + Shipping()) / Convert.ToDecimal(3.75); }
        }
        public decimal UnitUSDprice
        {
            get { return (Tax() + Shipping() + UnitPrice)  / Convert.ToDecimal(3.75); }
        }
        public decimal Tax()
        {
            return UnitPrice * Convert.ToDecimal(0.07);
        }
        public decimal Shipping()
        {
            return UnitPrice * Convert.ToDecimal(0.10);
        }
        #endregion

        public CartItem(int productId)
        {
            this.ProductId = productId;
        }

        public bool Equals(CartItem item)
        {
            return item.ProductId == this.ProductId;
        }
    }
}