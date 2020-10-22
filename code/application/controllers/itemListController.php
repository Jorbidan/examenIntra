<?php
//question 1
    require_once(PATH_CORE."/controller.php");
    require_once(PATH_MODELS."/itemListModel.php");
    class ItemListController extends Controller{
        const ADD_ITEM_PAGE_TITLE = "Ajout d'un item";
        const ITEMS_LIST_FOR_USER_PAGE_TITLE = "Les items de votre liste";
        const NO_ITEM_FOUND_PAGE_TITLE = "Aucun item";
        
        private $item_list_model;

        public function __construct(){
            $this->item_list_model = new ItemListModel();
        }

        public function add(){
            $this->show_add_item();  
        }

      

        private function show_add_item(){
            $view = new View("addItemListView.php");
            $data = array();
            $content = $view->render($data);
            echo $this->render_template_with_content(self::ADD_ITEM_PAGE_TITLE, $content);
        }

        public function show($id_user){
            $this->show_items($id_user);
        }

        private function show_items($id_user){ 
            //question 2
            
        }

    }

?>