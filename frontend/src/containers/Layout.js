import React from 'react';
import { Layout, Menu, Button } from 'antd';
import { Link } from 'react-router-dom';
import { connect } from 'react-redux';
import * as actions from '../store/actions/auth';
import Particles from 'react-particles-js';

import {
  BookOutlined,
} from '@ant-design/icons';

const { Header, Content, Sider } = Layout;

function CustomLayout(props) {

  return (
    <Layout>
    {props.isAuthenticated ? <Sider
      style={{
        overflow: 'auto',
        height: '100vh',
        position: 'fixed',
        left: 0,
      }}
    >
      <div className="logo" />
      <Menu theme="dark" mode="inline" defaultSelectedKeys={['1']}>
        <Menu.Item key="1" icon={<BookOutlined />}>
          <Link to="/col_list">My Book Collections</Link>
        </Menu.Item>
      </Menu>
    </Sider> : null}
    <Layout className="site-layout" style={props.isAuthenticated ? { marginLeft: 200 } : null}>
      <Header className="site-layout-background" style={{ padding: 0 }}>
        <Menu theme="dark" mode="horizontal" defaultSelectedKeys={['2']}>
          {
          props.isAuthenticated ? 
          <Button type="primary" style={{ float: 'right', marginTop: 15, marginRight: 20, backgroundColor: '#FF5833', borderColor: '#FF5833' }} onClick={props.logout}>
            <Link to="/">Logout</Link>
          </Button> 
          : 
          <Button type="primary" style={{ float: 'right', marginTop: 15, marginRight: 20 }}>
            <Link to="/">Login</Link>
          </Button>
          }
          {props.isAuthenticated ? <Button type="primary" style={{ float: 'right', marginTop: 15, marginRight: 20 }}><Link to="/account">Account</Link></Button> : null}
          {props.isAuthenticated ? null : <Button type="primary" style={{ float: 'right', marginTop: 15, marginRight: 20 }}><Link to="/register">Register</Link></Button>}
        </Menu>
      </Header>
      <Content style={{ padding: 24, margin: '24px 16px 0', overflow: 'initial' }}>
        <div className="site-layout-background" style={{ textAlign: 'center' }}>
          {props.children}
        </div>
      </Content>
    </Layout>
  </Layout>
  )
}

const mapStateToProps = (state) => {
  return {
    user_id: state.user_id,
  }
}

const mapDispatchToProps = (dispatch) => {
  return {
    logout: () => dispatch(actions.logout())
  }
}

export default connect(mapStateToProps, mapDispatchToProps)(CustomLayout);