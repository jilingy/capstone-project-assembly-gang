import React, { useState, useEffect } from 'react';
import {Row,Col,Typography,Card ,Modal, Comment, Avatar } from 'antd';
import BookCover from '..//images/book_cover.jpg';
//import axios from 'axios';
import { connect } from 'react-redux';

function BookDetail(props){

    const {Title, Text} = Typography

    const handleCancel = () => {
      props.updateVisible(!props.visible);
    };

    return(
      <div>
        <Modal
          title={null}
          visible={props.visible}
          footer={false}
          onCancel={handleCancel}
          mask={true}
          maskClosable={false}
          maskStyle ={{marginLeft:200, marginTop:60}}
          style ={{marginLeft:200,marginTop:-40}}
          bodyStyle={{height: 882}}
          width={1703}
        >
          <Row gutter={16}>
          <Col span={8}>
            <Card 
              style={{ width: 400, height: 400, background: '#cfcdc6'}}
              cover={<img alt="example" src={BookCover} />}
            />
          </Col>
          <Col span={8}>
          <Title>
              {props.book_title}
          </Title>
          </Col>
          <Col span={8}>
            <Title level={4}>Your Review</Title>
            <Comment
      //actions={actions}
      author={<a>Eric Shen</a>}
      avatar={
        <Avatar
          src={BookCover}
          alt="Han Solo"
        />
      }
      content={
        <p>
          This book fucking sucks
        </p>
      }
    />
          </Col>
          </Row>
          <p>{props.book_synopsis}</p>
          <p>{props.book_publisher}</p>
          <p>{props.publication_date}</p>
          <p>{props.genre}</p>
          <p>{props.average_rating}</p>
        </Modal>
      </div>
    )
}

const mapStateToProps = state => {
  return {
      user_id: state.user_id,
  }
}

export default connect(mapStateToProps)(BookDetail);