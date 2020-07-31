import React, { useState, useEffect } from 'react';
import { apiBooks } from '../services/utilities/API';
import CustomCard from '../components/Card';
import { connect } from 'react-redux';


function Recommendations(props) {


    return (
        <div>
            hello
        </div>
    )
}

const mapStateToProps = state => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(Recommendations);