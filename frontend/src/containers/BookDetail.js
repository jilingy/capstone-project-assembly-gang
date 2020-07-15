import React, { useState, useEffect } from 'react';
import { Modal } from 'antd';
//import axios from 'axios';
import { connect } from 'react-redux';

function BookDetail(props){

    return(
      <div>
        <Modal
          title="Basic Modal"
          visible={props.show}
          footer={false}
          onCancel={props.hide}
          mask={false}
          maskClosable={false}
        >
          <p>{props.book_title}</p>
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