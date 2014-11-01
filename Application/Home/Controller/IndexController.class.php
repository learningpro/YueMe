<?php
namespace Home\Controller;
use Think\Controller;
class IndexController extends Controller {
    public function index(){
        $this->display();
    }

    public function create(){
        // 获取表单的POST数据
        $data["userID"] = I("post.userID");
        $data["description"] = I("post.description");
        $data["org"] = I("post.org");
        $data["userList"] = I("post.userList");
        $data["Count"] = I("post.Count");
        $data["isAnon"] = I("post.isAnon");
        $data["expireTime"] = I("post.expireTime");
        $data["photo"] = I("post.photo");
        $data["isFinished"] = I("post.isFinished");

        $activities_info = M("activities_info");
        $result = $activities_info->create($data);
        $activities_info->add();
        dump($result);
    }

    public function search(){
        $activities_info = M("activities_info");
        $data = $activities_info->select();
        dump($data);
    }

    public function update(){

    }
    //  0 默认，未确认
    //  1 确认
    //  2 拒绝
    //  3 已删
    public function updateStatusToConfirmed(){
        $activities_status = M("activities_status");
        $data["status"] = 1;
        $condition["userID"] = array("EQ", I("post.userID"));
        $condition["actID"] = array("EQ", I("post.actID"));
        $activities_status->where($condition)->data($data)->save();
    }
    public function updateStatusToDenied(){
        $activities_status = M("activities_status");
        $data["status"] = 2;
        $condition["userID"] = array("EQ", I("post.userID"));
        $condition["actID"] = array("EQ", I("post.actID"));
        $activities_status->where($condition)->data($data)->save();
    }
    public function labelStatusToConfirmed(){
        $activities_status = M("activities_status");
        $data["status"] = 1;
        $condition["userID"] = array("EQ", I("post.userID"));
        $condition["actID"] = array("EQ", I("post.actID"));
        $activities_status->where($condition)->data($data)->save();
    }
    public function deleteActivity(){

    }
    public function viewHistoryByMe(){
        $activities_info = M("activities_info");
        $conditon["userID"] = array("EQ", I("post.userID"));
        $data = $activities_info->where($condition)->select();
        dump($data);
    }
    public function viewHistoryIncludeMe(){

    }
}
?>