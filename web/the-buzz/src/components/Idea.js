import React, { useState } from 'react';
import './Idea.css';

function Idea(props) {
    const key = props.id;
    const message = props.message;
    //const numLikes = props.likes;

    const [likes, setLikes] = useState(props.likes);

    return (
        <div className="row">
            <div className="drop">
                Placeholder
            </div>
            <div className="info">
                <div className="idea-content">
                    {/* <div className="title">
                        <h3>{title}</h3>
                    </div>
                    <div className="author" >
                        <h4>{author}</h4>
                    </div> */}
                    <div className="message">
                        <h4>{message}</h4>
                    </div>
                </div>
                <div className="likes">
                    <button type="button" className="like_button" onClick={() => incrementLike(likes, setLikes)}>Like</button>
                    <button type="button" className="dislike_button" onClick={() => decrementLike(likes, setLikes)}>Dislike</button>
                    <span className="like_count">{likes}</span>
                </div>
            </div>
        </div>
    );

    function incrementLike(likes, setLikes) {
        const doAjax = async () => {
            await fetch(`/messages/${key}/like/increment`, {
                method: 'PUT',
                headers: {
                    'Content-type': 'application/json; charset=UTF-8'
                }
            }).then((response) => {
                // If we get an "ok" message, return the json
                if (response.ok) {
                    // return response.json();
                    return Promise.resolve(response.json());
                }
                // Otherwise, handle server errors with a detailed popup message
                else {
                    window.alert(`The server replied not ok: ${response.status}\n` + response.statusText);
                }
                // return response;
                return Promise.reject(response);
            }).then((data) => {
                console.log(data);
                setLikes(data.mData.mLikes);
            }).catch((error) => {
                console.warn('Something went wrong.', error);
                window.alert("Unspecified error");
            });
        }

        doAjax().then(console.log).catch(console.log);
    }

    function decrementLike(likes, setLikes) {
        const doAjax = async () => {
            await fetch(`/messages/${key}/like/decrement`, {
                method: 'PUT',
                headers: {
                    'Content-type': 'application/json; charset=UTF-8'
                }
            }).then((response) => {
                // If we get an "ok" message, return the json
                if (response.ok) {
                    // return response.json();
                    return Promise.resolve(response.json());
                }
                // Otherwise, handle server errors with a detailed popup message
                else {
                    window.alert(`The server replied not ok: ${response.status}\n` + response.statusText);
                }
                // return response;
                return Promise.reject(response);
            }).then((data) => {
                console.log(data);
                setLikes(data.mData.mLikes);
            }).catch((error) => {
                console.warn('Something went wrong.', error);
                window.alert("Unspecified error");
            });
        }

        doAjax().then(console.log).catch(console.log);
    }
}



export default Idea;
