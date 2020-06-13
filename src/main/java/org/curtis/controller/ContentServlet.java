package org.curtis.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping(value = "/")
public class ContentServlet {
    @RequestMapping(value = "/")
    public ModelAndView main() {
        ModelAndView page = new ModelAndView("main");

        page.addObject("content", "outline");

        return page;
    }

    @RequestMapping(value = "/{pageNumber}")
    public ModelAndView content(@PathVariable String pageNumber, HttpServletRequest request) {
        if (pageNumber == null) return main();

        ModelAndView page = new ModelAndView("main");

        String content;
        switch (pageNumber) {
            case "1":
                content = "outline";
                break;
            case "2":
                content = "page2";
                break;
            default:
                return main();
        }

        page.addObject("content", content);

        return page;
    }
}
