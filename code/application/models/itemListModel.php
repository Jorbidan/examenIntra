<?php
    //Question 2
    require_once(PATH_CORE."/dbModel.php");
    require_once(PATH_DTO."/itemDTO.php");
    class ItemListModel extends DBModel{
        const GET_ITEMS_FOR_USER = "get_items_for_user";

        public function show_items($id_user){
            
            $pdo = $this->get_pdo_instance();
            $statementHandle = $pdo ->prepare("CALL ".self::GET_ITEMS_FOR_USER."(:id_user)");
            $statementHandle->execute(["id_user"=>$id_user]);
            $evaluationResult =$statementHandle->fetchAll(PDO::FETCH_ASSOC);
            return $itemsResult;
        }
        
    }
?>