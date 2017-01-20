<?php
class ControllerCheckoutOperatorLogin extends Controller {
    public function index()
    {

        //  echo"<pre>"; var_dump($this->user); die;

        $this->load->language('checkout/operator');

        $this->document->setTitle($this->language->get('heading_title'));

        if ($this->user->isLogged() && isset($this->request->get['token']) && ($this->request->get['token'] == $this->session->data['token'])) {
            $this->response->redirect($this->url->link('checkout/operator', 'token=' . $this->session->data['token'], true));
        }

        if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
            $this->session->data['token'] = token(32);

            if (isset($this->request->post['redirect']) && (strpos($this->request->post['redirect'], HTTP_SERVER) === 0 || strpos($this->request->post['redirect'], HTTPS_SERVER) === 0)) {
                $this->response->redirect($this->request->post['redirect'] . '&token=' . $this->session->data['token']);
            } else {
                $this->response->redirect($this->url->link('checkout/operator', 'token=' . $this->session->data['token'], true));
            }
        }

        $data['heading_title'] = $this->language->get('heading_title');

        $data['text_login'] = $this->language->get('text_login');
        $data['text_forgotten'] = $this->language->get('text_forgotten');

        $data['entry_username'] = $this->language->get('entry_username');
        $data['entry_password'] = $this->language->get('entry_password');

        $data['button_login'] = $this->language->get('button_login');

        if ((isset($this->session->data['token']) && !isset($this->request->get['token'])) || ((isset($this->request->get['token']) && (isset($this->session->data['token']) && ($this->request->get['token'] != $this->session->data['token']))))) {
            $this->error['warning'] = $this->language->get('error_token');
        }

        if (isset($this->error['warning'])) {
            $data['error_warning'] = $this->error['warning'];
        } else {
            $data['error_warning'] = '';
        }

        if (isset($this->session->data['success'])) {
            $data['success'] = $this->session->data['success'];

            unset($this->session->data['success']);
        } else {
            $data['success'] = '';
        }

        $data['action'] = $this->url->link('checkout/operator_login', '', true);

        if (isset($this->request->post['username'])) {
            $data['username'] = $this->request->post['username'];
        } else {
            $data['username'] = '';
        }

        if (isset($this->request->post['password'])) {
            $data['password'] = $this->request->post['password'];
        } else {
            $data['password'] = '';
        }

        if (isset($this->request->get['route'])) {
            $route = $this->request->get['route'];

            unset($this->request->get['route']);
            unset($this->request->get['token']);

            $url = '';

            if ($this->request->get) {
                $url .= http_build_query($this->request->get);
            }

            $data['redirect'] = $this->url->link($route, $url, true);
        } else {
            $data['redirect'] = '';
        }

        if ($this->config->get('config_password')) {
            $data['forgotten'] = $this->url->link('common/forgotten', '', true);
        } else {
            $data['forgotten'] = '';
        }

        if ($this->request->server['HTTPS']) {
            $server = $this->config->get('config_ssl');
        } else {
            $server = $this->config->get('config_url');
        }

        if (is_file(DIR_IMAGE . $this->config->get('config_logo'))) {
            $data['logo'] = $server . 'image/' . $this->config->get('config_logo');
        } else {
            $data['logo'] = '';
        }

//        $data['header'] = $this->load->controller('common/header');
//        $data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('checkout/operator_login', $data));
    }

        protected function validate() {
            if (!isset($this->request->post['username']) || !isset($this->request->post['password']) ||
                !$this->user->login($this->request->post['username'], html_entity_decode($this->request->post['password'], ENT_QUOTES, 'UTF-8'))) {
                $this->error['warning'] = $this->language->get('error_login');
            }

            return !$this->error;
        }

//     $this->load->language('checkout/operator');
//
//        $data['login_logout'] = $this->language->get('login_logout');
//        $data['login_denied'] = $this->language->get('login_denied');
//        $data['login_login'] = $this->language->get('login_login');
//        $data['login_password'] = $this->language->get('login_password');
//
//
//        include 'config_operator.php';
//
//        if (isset($this->request->post['login']) && isset($this->request->post['password'])) {
//            if(!empty($this->request->post['login']) && !empty($this->request->post['password'])) {
//                if(($this->request->post['login'] == ADMIN_LOGIN) && (md5($this->request->post['password']) == ADMIN_PASSWORD)) {
//
//                    $this->session->data['operator_login'] = ADMIN_LOGIN;
//                    $this->session->data['operator_password'] = ADMIN_PASSWORD;
//
//                    header('Location: index.php?route=checkout/operator');
//                } else {
//                    echo $data['login_denied']."<br>";
//                }
//            }
//        }
//
//        if(isset($this->request->get['action']) && ($this->request->get['action'] == 'logout')) {
//
//            unset($this->session->data['operator_password']);
//            unset($this->session->data['operator_login']);
//            unset($this->request->post['login']);
//            unset($this->request->post['password']);
//            header('Location: index.php?route=checkout/operator');
//        }
//
//        if(isset($_SERVER['HTTP_REFERER'])) {
//            if (strripos($_SERVER['HTTP_REFERER'], 'checkout/operator')) {
//                echo $data['login_logout']."<br>";
//            }
//        }
//
//        $this->response->setOutput($this->load->view('checkout/operator_login', $data));
//    }
}
