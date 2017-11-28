package com.support.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.support.model.Menu;
import com.support.model.User;
import com.support.service.MenuService;
import com.support.service.UserService;
import com.support.utils.Constants;
import com.support.utils.Utils;

@Controller
@RequestMapping("/sys")
public class MainController {

	Logger log = Logger.getLogger(MainController.class);

	@Resource
	private UserService userService;
	@Resource
	private MenuService menuService;
	
	
	@RequestMapping("/register")
	@ResponseBody
	public Object register(User user) {
		Map<String, Object> map = userService.register(user);
		return (JSON) JSON.toJSON(map);
	}
	/**
	 * 登录页登录
	 * 
	 * @param request
	 * @param mv
	 * @param user
	 * @return
	 */
	@RequestMapping("/login")
	public ModelAndView login(HttpServletRequest request, ModelAndView mv, User user) {
		log.info("-----进入登陆接口-----");
		log.info(Utils.isNull(user.getLoginId()));
		log.info(Utils.isNull(user.getPassword()));
		Map<String, Object> map = new HashMap<String, Object>();

		String flag = "";// 信息为空

		// 检查帐号密码是否为空
		if (user == null || Utils.isNull(user.getLoginId()) || Utils.isNull(user.getPassword())) {
			map.put("user", user);
			map.put("flag", flag);
			mv.setViewName("login");
			mv.addAllObjects(map);
			return mv;
		}

		// 检查是否存在该账户
		User dbUser = userService.getUserByLoginId(user);
		try {
			String password = user.getPassword();
			if (dbUser != null) {
				if (dbUser.getPassword().equals(Utils.string2MD5(password))) {
					flag = "1"; // 验证通过
					HttpSession hs = request.getSession();
					hs.setAttribute(Constants.LOGIN_ATTRIBUTE_NAME, dbUser);
				} else {
					flag = "3";// 密码不正确
				}
			} else {
				flag = "2";// 用户名不存在
			}
		} catch (Exception e) {
			log.error("用户登录失败！", e);
			flag = "4";
		}

		// 处理返回的视图
		if (flag.equals("1")) {
			mv.setViewName("redirect:index.do");
		} else {
			map.put("user", user);
			map.put("flag", flag);
			mv.setViewName("login");
		}
		mv.addAllObjects(map);
		return mv;
	}

	/**
	 * 登录系统成功后跳转首页
	 */
	@RequestMapping("/index")
	public ModelAndView index(HttpServletRequest request, ModelAndView mv) {
		HttpSession session = request.getSession();
		User user = (User) session.getAttribute(Constants.LOGIN_ATTRIBUTE_NAME);

		// 先判断session中是否存在用户信息
		if (user == null || user.getP_code() == null) {
			mv.setViewName("home");
		} else {
			Map<String, Object> map = new HashMap<String, Object>();
			try {
				// 登录情况下查询菜单信息
				// List<Menu> menuList =
				// menuService.queryMenuList(user.getUserId()); 后期如果需要权限在加
				// List<Menu> menuList = menuService.queryMenuList();

				List<Menu> menuList = getMenuList();
				System.out.println(JSON.toJSON(menuList));
				map.put("user", user);
				map.put("menuList", JSON.toJSON(menuList));
				session.setAttribute(Constants.LOGIN_MENU_INIT_NAME, menuList);

			} catch (Exception e) {
				log.error("查询菜单列表失败！", e);
			} finally {
				mv.addAllObjects(map);
			}
			mv.setViewName("home");
		}
		return mv;
	}

	/**
	 * 获取菜单栏 只有三级菜单
	 * 
	 * @return
	 */
	private List<Menu> getMenuList() {
		List<Menu> head = menuService.queryTopMenuList();
		if (head == null) {
			return null;
		}
		for (int i = 0; i < head.size(); i++) {
			Menu topMenu = head.get(i);
			List<Map<String, Object>> next = menuService.queryMenuList(topMenu.getId());
			topMenu.setChildMenus(next);
			for (int j = 0; j < next.size(); j++) {
				Map<String, Object> nextMenu = next.get(j);
				List<Map<String, Object>> last = menuService.queryMenuList((Integer) nextMenu.get("id"));
				nextMenu.put("childMenus", last);
				for (int z = 0; z < last.size(); z++) {
					Map<String, Object> lastMenu = last.get(z);
					lastMenu.put("childMenus", "");
				}
			}
		}
		return head;
	}

	@RequestMapping("/updatePWD")
	@ResponseBody
	public JSON setPassword(User user) {
		Map<String, Object> map = userService.setPassword(user);
		return (JSON) JSON.toJSON(map);
	}
}
