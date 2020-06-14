package org.curtis.controller;

import org.curtis.content.ContentMenu;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value = "/")
public class ContentServlet {
    @RequestMapping(value = "/")
    public ModelAndView main() {
        return content(null);
    }

    @RequestMapping(value = "/{pageNumber}")
    public ModelAndView content(@PathVariable String pageNumber) {
        ModelAndView page = new ModelAndView("main");

        page.addObject("menu", ContentMenu.getMenu());
        page.addObject("content", ContentMenu.getContentMenuItem(pageNumber));

        return page;
    }
}
