package com.tp.asset.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tp.asset.common.SessionVariables;
import com.tp.asset.container.AssetContainer;
import com.tp.asset.viewBean.AssetBean;
import com.tp.asset.viewBean.EmployeeBean;

@Controller
public class AssetController {
	public List<String> lstEmpBean = null;
	public String selectedEmp = "";
	private List<AssetBean> lstAsset = new ArrayList<AssetBean>();
	private int getRow;
	@RequestMapping(value = "/addasset", method = RequestMethod.GET)
	public ModelAndView displayAsset(HttpServletRequest request, HttpServletResponse response, AssetBean assetBean) {
		System.out.println("displayAsset");

		HttpSession session = request.getSession();
		lstEmpBean = (ArrayList<String>) session.getAttribute(SessionVariables.empID);
		session.setAttribute(SessionVariables.title, "Add Asset");
		assetBean.setEmployeeIDS(lstEmpBean);
		ModelAndView model = new ModelAndView("addasset");
		// LoginBean loginBean = new LoginBean();
		model.addObject("assetBean", assetBean);
		return model;
	}

	@RequestMapping(value = "/updateasset", method = RequestMethod.GET)
	public ModelAndView updateAsset(HttpServletRequest request, HttpServletResponse response, AssetBean assetBean,
			@RequestParam("getRow") int getRow) {
		System.out.println("updateAsset");
		this.getRow = getRow;
		HttpSession session = request.getSession();
		session.setAttribute(SessionVariables.title, "Update Asset");
		lstEmpBean = (ArrayList<String>) session.getAttribute(SessionVariables.empID);
		assetBean = lstAsset.get(getRow);
		assetBean.setEmployeeIDS(lstEmpBean);
		ModelAndView model = new ModelAndView("updateasset");
		// LoginBean loginBean = new LoginBean();
		model.addObject("assetBean", assetBean);
		return model;
	}

	@RequestMapping(value = "/addasset", method = RequestMethod.POST)
	public ModelAndView executeAsset(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("assetBean") AssetBean assetBean) {
		System.out.println("add asset");
		ModelAndView model = null;
		try {
			HttpSession session = request.getSession();
			lstAsset.add(assetBean);
			session.setAttribute(SessionVariables.assetDetails, lstAsset);
			model = new ModelAndView("home");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
	
	@RequestMapping(value = "/updateasset", method = RequestMethod.POST)
	public ModelAndView updateexeAsset(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("assetBean") AssetBean assetBean) {
		System.out.println("add asset");
		ModelAndView model = null;
		try {
			HttpSession session = request.getSession();
				lstAsset.remove(this.getRow);
				lstAsset.add(assetBean);
			session.setAttribute(SessionVariables.assetDetails, lstAsset);
			model = new ModelAndView("home");
		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}

	@RequestMapping(value = "/viewassetlist", method = RequestMethod.GET)
	public ModelAndView displayViewAsset(HttpServletRequest request, HttpServletResponse response,
			AssetContainer lstassetBean) {
		System.out.println("display view Asset");
		// lstassetBean = lstAsset;
		AssetContainer assetList = new AssetContainer();
		assetList.setLstAssetBean(lstAsset);
		System.out.println("Asset count : " + assetList.getLstAssetBean().size());
		lstassetBean = assetList;
		ModelAndView model = new ModelAndView("viewassetlist");
		model.addObject("lstassetBean", lstassetBean);
		return model;
	}

	@RequestMapping(value = "/viewassetlist", method = RequestMethod.POST)
	public ModelAndView searchViewAsset(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("assetBean") AssetBean assetBean) {
		System.out.println("edit asset");
		ModelAndView model = null;
		try {
			// System.out.println(employeeBean.getUsername() + " - " +
			// employeeBean.getPassword());
			HttpSession session = request.getSession();
			int iIndex = lstAsset.indexOf(assetBean);
			if (iIndex != -1) {
				model = new ModelAndView("addasset");
				model.addObject("assetBean", assetBean);
			} else {
				model = new ModelAndView("viewassetlist");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return model;
	}
}
