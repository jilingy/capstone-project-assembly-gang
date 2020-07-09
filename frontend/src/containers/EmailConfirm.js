import React, { useEffect } from 'react';
import { connect } from 'react-redux';
import axios from 'axios';

// Use this component to do the necessary backend tasks after user sets up 
// account -- like set up default collections etc.

function EmailConfirm(props) {

    useEffect(() => {
            const createDefaultCollections = async () => {
                if(props.user_id !== null) {
                    await axios.post(`http://127.0.0.1:8000/api/collections/` , {
                    collection_type : "Main",
                    is_private      : false,
                    description     : 'This is your Main Collection',
                    collection_name : 'Main Collection',
                    owner           : props.user_id,

                })
                .catch(err => {
                    console.log(err);
                });
                await axios.post(`http://127.0.0.1:8000/api/collections/` , {
                    collection_type : "Finished",
                    is_private      : false,
                    description     : 'This is your Finished Collection',
                    collection_name : 'Finished Collection',
                    owner           : props.user_id,
                })
                .catch(err => {
                    console.log(err);
                });
            }
        }
        createDefaultCollections();
    } , [props.user_id])


    return (
        <div>
            <p>Confirmation Email Sent! Check your email and follow the link to verify your account.</p>
        </div>
    )
}

const mapStateToProps = (state) => {
    return {
        user_id: state.user_id,
    }
}

export default connect(mapStateToProps)(EmailConfirm);

