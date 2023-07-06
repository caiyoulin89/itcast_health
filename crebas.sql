/*==============================================================*/
/* DBMS name:      MySQL 5.0                                    */
/* Created on:     2023/5/18 16:52:48                           */
/*==============================================================*/


drop table if exists t_checkgroup;

drop table if exists t_checkgroup_checkitem;

drop table if exists t_checkitem;

drop table if exists t_member;

drop table if exists t_menu;

drop table if exists t_order;

drop table if exists t_ordersetting;

drop table if exists t_permission;

drop table if exists t_role;

drop table if exists t_role_menu;

drop table if exists t_role_permission;

drop table if exists t_setmeal;

drop table if exists t_setmeal_checkgroup;

drop table if exists t_user;

drop table if exists t_user_role;

/*==============================================================*/
/* Table: t_checkgroup                                          */
/*==============================================================*/
create table t_checkgroup
(
   id                   int(11) not null auto_increment,
   code                 varchar(32) default NULL,
   name                 varchar(32) default NULL,
   helpCode             varchar(32) default NULL,
   sex                  char(1) default NULL,
   remark               varchar(128) default NULL,
   attention            varchar(128) default NULL,
   primary key (id)
);

/*==============================================================*/
/* Table: t_checkgroup_checkitem                                */
/*==============================================================*/
create table t_checkgroup_checkitem
(
   checkgroup_id        int(11) not null default 0,
   checkitem_id         int(11) not null default 0,
   primary key (checkgroup_id, checkitem_id),
   key item_id (checkitem_id)
);

/*==============================================================*/
/* Table: t_checkitem                                           */
/*==============================================================*/
create table t_checkitem
(
   id                   int(11) not null auto_increment,
   code                 varchar(16) default NULL,
   name                 varchar(32) default NULL,
   sex                  char(1) default NULL,
   age                  varchar(32) default NULL,
   price                float default NULL,
   type                 char(1) default NULL comment '���������,��Ϊ���ͼ�������',
   attention            varchar(128) default NULL,
   remark               varchar(128) default NULL,
   primary key (id)
);

/*==============================================================*/
/* Table: t_member                                              */
/*==============================================================*/
create table t_member
(
   id                   int(11) not null auto_increment,
   fileNumber           varchar(32) default NULL,
   name                 varchar(32) default NULL,
   sex                  varchar(8) default NULL,
   idCard               varchar(18) default NULL,
   phoneNumber          varchar(11) default NULL,
   regTime              date default NULL,
   password             varchar(32) default NULL,
   email                varchar(32) default NULL,
   birthday             date default NULL,
   remark               varchar(128) default NULL,
   primary key (id)
);

/*==============================================================*/
/* Table: t_menu                                                */
/*==============================================================*/
create table t_menu
(
   id                   int(11) not null auto_increment,
   name                 varchar(128) default NULL,
   linkUrl              varchar(128) default NULL,
   path                 varchar(128) default NULL,
   priority             int(11) default NULL,
   icon                 varchar(64) default NULL,
   description          varchar(128) default NULL,
   parentMenuId         int(11) default NULL,
   level                int(11) default NULL,
   primary key (id),
   key FK_Reference_13 (parentMenuId)
);

/*==============================================================*/
/* Table: t_order                                               */
/*==============================================================*/
create table t_order
(
   id                   int(11) not null auto_increment,
   member_id            int(11) default NULL comment 'Ա��id',
   orderDate            date default NULL comment 'ԼԤ����',
   orderType            varchar(8) default NULL comment 'ԼԤ���� �绰ԤԼ/΢��ԤԼ',
   orderStatus          varchar(8) default NULL comment 'ԤԼ״̬���Ƿ��',
   setmeal_id           int(11) default NULL comment '����id',
   primary key (id),
   key key_member_id (member_id),
   key key_setmeal_id (setmeal_id)
);

/*==============================================================*/
/* Table: t_ordersetting                                        */
/*==============================================================*/
create table t_ordersetting
(
   id                   int(11) not null auto_increment,
   orderDate            date default NULL comment 'ԼԤ����',
   number               int(11) default NULL comment '��ԤԼ����',
   reservations         int(11) default NULL comment '��ԤԼ����',
   primary key (id)
);

/*==============================================================*/
/* Table: t_permission                                          */
/*==============================================================*/
create table t_permission
(
   id                   int(11) not null auto_increment,
   name                 varchar(32) default NULL,
   keyword              varchar(64) default NULL,
   description          varchar(128) default NULL,
   primary key (id)
);

/*==============================================================*/
/* Table: t_role                                                */
/*==============================================================*/
create table t_role
(
   id                   int(11) not null auto_increment,
   name                 varchar(32) default NULL,
   keyword              varchar(64) default NULL,
   description          varchar(128) default NULL,
   primary key (id)
);

/*==============================================================*/
/* Table: t_role_menu                                           */
/*==============================================================*/
create table t_role_menu
(
   role_id              int(11) not null,
   menu_id              int(11) not null,
   primary key (role_id, menu_id),
   key FK_Reference_10 (menu_id)
);

/*==============================================================*/
/* Table: t_role_permission                                     */
/*==============================================================*/
create table t_role_permission
(
   role_id              int(11) not null,
   permission_id        int(11) not null,
   primary key (role_id, permission_id),
   key FK_Reference_12 (permission_id)
);

/*==============================================================*/
/* Table: t_setmeal                                             */
/*==============================================================*/
create table t_setmeal
(
   id                   int(11) not null auto_increment,
   name                 varchar(128) default NULL,
   code                 varchar(8) default NULL,
   helpCode             varchar(16) default NULL,
   sex                  char(1) default NULL,
   age                  varchar(32) default NULL,
   price                float default NULL,
   remark               varchar(128) default NULL,
   attention            varchar(128) default NULL,
   img                  varchar(128) default NULL,
   primary key (id)
);

/*==============================================================*/
/* Table: t_setmeal_checkgroup                                  */
/*==============================================================*/
create table t_setmeal_checkgroup
(
   setmeal_id           int(11) not null default 0,
   checkgroup_id        int(11) not null default 0,
   primary key (setmeal_id, checkgroup_id),
   key checkgroup_key (checkgroup_id)
);

/*==============================================================*/
/* Table: t_user                                                */
/*==============================================================*/
create table t_user
(
   id                   int(11) not null auto_increment,
   birthday             date default NULL,
   gender               varchar(1) default NULL,
   username             varchar(32) default NULL,
   password             varchar(256) default NULL,
   remark               varchar(32) default NULL,
   station              varchar(1) default NULL,
   telephone            varchar(11) default NULL,
   primary key (id)
);

/*==============================================================*/
/* Table: t_user_role                                           */
/*==============================================================*/
create table t_user_role
(
   user_id              int(11) not null,
   role_id              int(11) not null,
   primary key (user_id, role_id),
   key FK_Reference_8 (role_id)
);

alter table t_checkgroup_checkitem add constraint group_id foreign key (checkgroup_id)
      references t_checkgroup (id);

alter table t_menu add constraint FK_Reference_13 foreign key (parentMenuId)
      references t_menu (id);

alter table t_order add constraint key_member_id foreign key (member_id)
      references t_member (id);

alter table t_role_menu add constraint FK_Reference_10 foreign key (menu_id)
      references t_menu (id);

alter table t_role_menu add constraint FK_Reference_9 foreign key (role_id)
      references t_role (id);

alter table t_role_permission add constraint FK_Reference_11 foreign key (role_id)
      references t_role (id);

alter table t_role_permission add constraint FK_Reference_12 foreign key (permission_id)
      references t_permission (id);

alter table t_setmeal_checkgroup add constraint checkgroup_key foreign key (checkgroup_id)
      references t_checkgroup (id);

alter table t_setmeal_checkgroup add constraint setmeal_key foreign key (setmeal_id)
      references t_setmeal (id);

alter table t_user_role add constraint FK_Reference_7 foreign key (user_id)
      references t_user (id);

alter table t_user_role add constraint FK_Reference_8 foreign key (role_id)
      references t_role (id);

