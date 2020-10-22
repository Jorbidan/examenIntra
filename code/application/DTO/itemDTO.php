<?php
    class ItemDTO{
        private $tbl_item_list;
        private $name;
        private $quantity;
        private $id_user;

        public function get_id(){
            return $this->id_user;
        }

        public function get_name(){
            return $this->name;
        }

        public function get_quantity(){
            return $this->quantity;
        }
        
        public function get_id_user(){
            return $this->id_user;
        }
    }
?>