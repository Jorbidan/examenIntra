<?php
    require_once(PATH_CORE."/controller.php");
    
    class SessionController extends Controller{
        const SESSION_PAGE_TITLE = "Les sessions et cookies";

        public function __construct(){
            session_start();
            $_SESSION["OptionsValeur"] = "desactiver";
        }

        public function add(){
            //question 3
            $_SESSION["OptionsValeur"] = "activé";
        }

        public function show(){
            //question 5
            $view = new View("sessionView.php");
            $data = array();
            $content = $view->render($data);
            echo $this->render_template_with_content(self::SESSION_PAGE_TITLE, $content);
        }

        public function cookie(){
            $this->addCookie();
            $view = new View("sessionView.php");
            $data = array();
            $content = $view->render($data);
            echo $this->render_template_with_content(self::SESSION_PAGE_TITLE, $content);
        }

        private function addCookie(){
            //question 4
            
        }
    }

?>