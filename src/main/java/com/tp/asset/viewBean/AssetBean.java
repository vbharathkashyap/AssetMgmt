package com.tp.asset.viewBean;

import java.util.List;

public class AssetBean
{
		private String assetID;
		
		private String assetProductName;
		
		private String assetModelName;
		
		private String assetProductCondition;

		private String assetProductColor;
		
		private String assetInUse;
		
		private String employeeID;
		
		private List<String> employeeIDS;
		
		public List<String> getEmployeeIDS() {
			return employeeIDS;
		}

		public void setEmployeeIDS(List<String> employeeIDS) {
			this.employeeIDS = employeeIDS;
		}

		public String getEmployeeID() {
			return employeeID;
		}

		public void setEmployeeID(String employeeID) {
			this.employeeID = employeeID;
		}

		public String getAssetID() {
			return assetID;
		}

		public void setAssetID(String assetID) {
			this.assetID = assetID;
		}

		public String getAssetProductName() {
			return assetProductName;
		}

		public void setAssetProductName(String assetProductName) {
			this.assetProductName = assetProductName;
		}

		public String getAssetModelName() {
			return assetModelName;
		}

		public void setAssetModelName(String assetModelName) {
			this.assetModelName = assetModelName;
		}
		
		public String getAssetProductCondition() {
			return assetProductCondition;
		}

		public void setAssetProductCondition(String assetProductCondition) {
			this.assetProductCondition = assetProductCondition;
		}

		public String getAssetProductColor() {
			return assetProductColor;
		}

		public void setAssetProductColor(String assetProductColor) {
			this.assetProductColor = assetProductColor;
		}

		public String getAssetInUse() {
			return assetInUse;
		}

		public void setAssetInUse(String assetInUse) {
			this.assetInUse = assetInUse;
		}

		
}
