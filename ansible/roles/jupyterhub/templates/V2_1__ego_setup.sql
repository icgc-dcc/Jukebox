insert  into egoapplication (name, clientid, clientsecret, redirecturi, description, status, type) values ('{{ego_client_id}}','{{ego_client_id}}','{{ego_client_secret}}','{{ego_base_url}}','{{ego_client_id}}','APPROVED','ADMIN') on conflict do nothing;

insert into policy (name) values ('{{ego_policy}}') on conflict do nothing;

insert into egouser (name,email,type,firstname,lastname,createdat,lastlogin,status,preferredlanguage) values ('{{ego_user_email}}','{{ego_user_email}}','ADMIN','string','string',current_timestamp,current_timestamp,'APPROVED','ENGLISH') on conflict do nothing;

insert into userpermission (user_id,policy_id,access_level) select u.id,p.id, 'READ' from egouser u, policy p where u.email = '{{ego_user_email}}' and p.name='{{ego_policy}}'  on conflict do nothing;
