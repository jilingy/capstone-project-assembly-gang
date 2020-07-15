import React, { useState, useEffect } from 'react';
import { WhiteSpace,Row,Col,Typography,Card ,Modal } from 'antd';
import BookCover from '..//images/book_cover.jpg';
//import axios from 'axios';
import { connect } from 'react-redux';

function BookDetail(props){

    const {Title, Text} = Typography

    return(
      <div>
        <Modal
          title={null}
          visible={props.show}
          footer={false}
          onCancel={props.hide}
          mask={true}
          maskClosable={false}
          maskStyle ={{marginLeft:200, marginTop:60}}
          style ={{marginLeft:200,marginTop:-40}}
          bodyStyle={{height: 882}}
          width={1703}
        >
          <Row gutter={16}>
          <Col>
            <Card 
              style={{ width: 400, height: 400, background: '#cfcdc6'}}
              cover={<img alt="example" src={BookCover} />}
            />
          </Col>
          <Col>
          <Title>
              {props.book_title}
          </Title>
          </Col>
          </Row>
          <WhiteSpace/>
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